import 'package:flutter/material.dart';
import 'package:movie_test/ui/common_widgets/movie_card_poster_widget/movie_card_info_widget/star_and_rating_widget/subwidget/rating_widget/rating_widget.dart';
import 'package:movie_test/ui/common_widgets/movie_card_poster_widget/movie_card_info_widget/star_and_rating_widget/subwidget/star_widget/star_widget.dart';
class StarAndRatingWidget extends StatelessWidget {
  const StarAndRatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        RatingWidget(),
        SizedBox(width: 12),
        StarWidget(),
      ],
    );
  }
}
