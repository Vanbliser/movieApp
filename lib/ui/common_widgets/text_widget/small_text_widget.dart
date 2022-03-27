import 'package:flutter/material.dart';

class SmallTextWidget extends StatelessWidget {
  final String data;
  final Color color;
  const SmallTextWidget(
      {Key? key, required this.data, this.color = const Color(0xffffffff)})
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}
