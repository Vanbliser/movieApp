import 'package:flutter/material.dart';
import 'package:movie_test/ui/common_widgets/movie_card_poster_widget/movie_card_info_widget/star_and_rating_widget/start_and_rating_widget.dart';
import 'package:movie_test/ui/common_widgets/text_widget/small_text_widget.dart';

class MovieCardInfoWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const MovieCardInfoWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        StarAndRatingWidget(data: data),
        const SizedBox(height: 12),
        SmallTextWidget(data: data['title']),
        const SizedBox(height: 12),
      ],
    );
  }
}
