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
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  dynamic type;
  final _formKey = GlobalKey<FormState>();
  int bob = 5;
  List<RequestItem> entries = <RequestItem>[];
  List<int> colorCodes = <int>[];

  void _incrementCounter() {
    _counter++;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(30),
          shape: const RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(25.0))
               ),
          title: const Text('billy bob and friends'),
          content: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                right: -40.0,
                top: -40.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const CircleAvatar(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Row(
                        children: <Widget>[
                          Expanded(child: ElevatedButton(onPressed: () {type = false;},child: Text("Request"))),
                          Expanded(child: ElevatedButton(onPressed: () {type = true;},child: Text("Post"))),
            ] ,
          ),
        )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: titleController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: descriptionController,
                      ),
                    ),
                    Padding(
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
                    )
                  ],
                ),
              ),
            ],
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
