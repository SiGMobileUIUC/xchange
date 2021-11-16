import 'package:flutter/widgets.dart';

class RequestItem extends StatelessWidget {
  final String title;
  final String description;
  final int type;

  const RequestItem({
    Key? key,
    required this.title,
    required this.description,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(type == 1 ? "Post: " : "Request: " + title),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Description: " + description),
        ),
      ],
    );
  }
}
