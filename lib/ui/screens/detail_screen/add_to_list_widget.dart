import 'package:flutter/material.dart';

class AddToListWidget extends StatelessWidget {
  const AddToListWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.add_box_rounded),
        SizedBox(width: 50),
        Icon(Icons.send_outlined)
      ],
    );
  }
}