import 'package:flutter/material.dart';

class BigTextWidget extends StatelessWidget {
  final String data;
  const BigTextWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xffffffff),
      ),
    );
  }
}
