import 'package:flutter/material.dart';
import 'package:movie_test/ui/common_widgets/movie_card_poster_widget/movie_card_info_widget/movie_card_info_widget.dart';

class MovieCardPosterWidget extends StatefulWidget {
  const MovieCardPosterWidget({Key? key}) : super(key: key);

  @override
  State<MovieCardPosterWidget> createState() => _MovieCardPosterWidgetState();
}

class _MovieCardPosterWidgetState extends State<MovieCardPosterWidget> {
  late final int count;
  @override
  void initState() {
    count = 5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      //height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (_, constraint) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 7.5),
              width: constraint.maxWidth,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0x44C4C4C4),
              ),
            ),
          ),
          const MovieCardInfoWidget(),
        ],
      ),
    );
  }
}
