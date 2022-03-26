import 'package:flutter/material.dart';
class SmallTextWidget extends StatefulWidget {
  final String data;
  final Color color;
  const SmallTextWidget(
      {Key? key, required this.data, this.color = const Color(0xffffffff)})
      : super(key: key);

  @override
  State<SmallTextWidget> createState() => _SmallTextWidgetState();
}

class _SmallTextWidgetState extends State<SmallTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.data,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: widget.color,
      ),
    );
  }
}
