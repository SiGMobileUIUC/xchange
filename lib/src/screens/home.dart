import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xchange/src/widgets/request_item.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  dynamic type;

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<RequestItem> entries = <RequestItem>[];
  List<int> colorCodes = <int>[];

  void _addPopup() {
    _counter++;

    Widget toggleType = Row(
      children: <Widget>[
        Expanded(
            child: ElevatedButton(
                onPressed: () => type = false, child: const Text("Request"))),
        Expanded(
            child: ElevatedButton(
                onPressed: () => type = true, child: const Text("Post"))),
      ],
    );

    Widget submitButton = Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: const Text("Submit"),
        onPressed: () {
          String title = titleController.text.toString();
          String description = descriptionController.text.toString();
          entries.add(
            RequestItem(
              title: title,
              description: description,
              t: type,
            ),
          );
          colorCodes.add(min(_counter * 100, 900));
          setState(() {});
        },
      ),
    );

    Widget form = Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          toggleType,
          // Form field 1
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: titleController,
            ),
          ),
          // Form field 2
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: descriptionController,
            ),
          ),
          submitButton,
        ],
      ),
    );

    Widget redXbutton(BuildContext context) {
      return Positioned(
        right: -10.0,
        top: -50.0,
        child: InkResponse(
          onTap: () => Navigator.of(context).pop(),
          child: const CircleAvatar(
            child: Icon(Icons.close),
            backgroundColor: Colors.red,
          ),
        ),
      );
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          title: const Text('billy bob and friends'),
          content: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[redXbutton(context), form],
          ),
        );
      },
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("billy bob and friend"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: entries[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPopup,
        tooltip: 'Add a Request/Post',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
