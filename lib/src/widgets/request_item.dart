import 'package:flutter/widgets.dart';

class RequestItem extends StatelessWidget {
  final String title;
  final String description;
  final bool t;

  const RequestItem({
    Key? key,
    required this.title,
    required this.description,
    required this.t,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        Text(description),
        Text(t ? "true" : "false"),
      ],
    );
  }
}
