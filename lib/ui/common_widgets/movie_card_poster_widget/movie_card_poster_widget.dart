import 'package:flutter/material.dart';
import 'package:movie_test/ui/common_widgets/movie_card_poster_widget/movie_card_info_widget/movie_card_info_widget.dart';

class MovieCardPosterWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const MovieCardPosterWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
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
                image: DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500' +
                          data['posterPath'],
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          MovieCardInfoWidget(data: data),
        ],
      ),
    );
  }
}
