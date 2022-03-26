import 'package:flutter/material.dart';

class AddToListWidget extends StatelessWidget {
  const AddToListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: (() {}),
          iconSize: 18,
          icon: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Padding(
              padding: EdgeInsets.all(2.0),
              child: Icon(Icons.add, size: 14),
            ),
          ),
        ),
        const SizedBox(width: 5),
        IconButton(
          onPressed: (() => {}),
          iconSize: 20,
          icon: Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: const ImageIcon(AssetImage('assets/image/send.png')),
          ),
        )
      ],
    );
  }
}
