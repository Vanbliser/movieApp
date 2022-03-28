import 'package:flutter/material.dart';
import 'package:movie_test/ui/common_widgets/text_widget/small_text_widget.dart';

class StarWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const StarWidget({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 25,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0x44C4C4C4)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const ImageIcon(
              AssetImage('assets/image/star.png'),
              color: Color(0xffF3AC4A),
              size: 15,
            ),
            SmallTextWidget(data: data['avgRating']),
          ],
        ),
      ),
    );
  }
}
