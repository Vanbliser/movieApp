import 'package:flutter/material.dart';
import 'package:movie_test/ui/common_widgets/text_widget/big_text_widget.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: const Align(
              alignment: Alignment.centerLeft,
              child: BigTextWidget(data: 'Coming Soon'))),
      AspectRatio(
          aspectRatio: 9 / 6,
          child: Container(
              clipBehavior: Clip.hardEdge,
              //child: const Image(image: AssetImage('assets/image/image.jpg')),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0x44C4C4C4)))),
    ]);
  }
}
