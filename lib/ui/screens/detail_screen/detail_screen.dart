import 'package:flutter/material.dart';
import 'package:movie_test/models/movies.dart';
import 'package:movie_test/ui/common_widgets/movie_card_poster_widget/movie_card_info_widget/star_and_rating_widget/start_and_rating_widget.dart';
import 'package:movie_test/ui/common_widgets/text_widget/big_text_widget.dart';
import 'package:movie_test/ui/screens/detail_screen/subwidgets/add_to_list_widget.dart';
import 'package:movie_test/ui/screens/detail_screen/subwidgets/detail_screen_banner.dart';

class DetailScreeen extends StatelessWidget {
  final Map<String, dynamic> data;
  final Movie movie;
  const DetailScreeen({Key? key, required this.data, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          DetailScreenBanner(data: data),
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StarAndRatingWidget(data: data),
                    AddToListWidget(data: data, movie:movie)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: BigTextWidget(data: data['title']),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      data['description'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
