import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xchange/src/widgets/request_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int type = 0; // 0 = neither, 1 = post, 2 = request

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<RequestItem> entries = <RequestItem>[];
  List<int> colorCodes = <int>[];

  void _addPopup() {
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
              type: type,
            ),
          );
          // colorCodes.add(min(_counter * 100, 900));

          setState(() {
            colorCodes.add(0);
          });
        },
      ),
    );

    List<Widget> toggleRequestPost(setState) {
      return [
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    type = 2;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    type == 2 ? Colors.purple : Colors.grey,
                  ),
                ),
                child: const Text("Request"))),
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    type = 1;
                  });
                },
                style: ElevatedButton.styleFrom(
                    primary: type == 1 ? Colors.purple : Colors.grey),
                child: const Text("Post"))),
      ];
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
              title: const Text('billy bob and friends'),
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: toggleRequestPost(setState),
                    ),
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
              ),
            );
          });
        });
  }

  Widget _buildColumn(int index) {
    return ListTile(
        title: entries[index],
        trailing: const Icon(
          Icons.star,
          color: Colors.red,
          semanticLabel: "delete",
        ),
        onTap: () {
          setState(() {
            entries.remove(entries[index]);
          });
        });
  }

  Widget _buildItems() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: entries.length * 2,
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(); /*2*/
          final index = i ~/ 2; /*3*/
          return _buildColumn(index);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("billy bob and friend"),
      ),
      body: _buildItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPopup,
        tooltip: 'Add a Request/Post',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
