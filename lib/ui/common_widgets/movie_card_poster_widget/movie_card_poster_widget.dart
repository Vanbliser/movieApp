import 'package:flutter/material.dart';
import 'package:movie_test/ui/common_widgets/movie_card_poster_widget/movie_card_info_widget/movie_card_info_widget.dart';

class MovieCardPosterWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const MovieCardPosterWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 165,
      child: Column(
        children: [
          LayoutBuilder(
            builder: (_, constraint) => Container(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.symmetric(horizontal: 7.5),
              width: constraint.maxWidth,
              height: (constraint.maxWidth * 3) / 2,
              child: FadeInImage.assetNetwork(
                fadeInDuration: const Duration(milliseconds: 300),
                fit: BoxFit.fill,
                placeholder: 'assets/image/imageY.jpg',
                image: 'https://image.tmdb.org/t/p/w500' + data['posterPath'],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0x44C4C4C4),
              ),
            ),
          ),
          MovieCardInfoWidget(data: data),
        ],
      ),
    );
  }
}
