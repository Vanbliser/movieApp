import 'package:flutter/material.dart';
import 'package:movie_test/ui/common_widgets/text_widget/big_text_widget.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BigTextWidget(data: 'My List Screen'),
    );
  }
}
