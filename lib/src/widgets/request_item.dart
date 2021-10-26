import 'package:flutter/widgets.dart';

class RequestItem extends StatelessWidget {
  final String a;
  final String b;

  const RequestItem({
    Key? key,
    required this.a,
    required this.b,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(a),
        Text(b),
      ],
    );
  }
}
