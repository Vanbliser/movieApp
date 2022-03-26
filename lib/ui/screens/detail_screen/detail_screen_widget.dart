import 'package:flutter/material.dart';
import 'package:movie_test/ui/common_widgets/movie_card_poster_widget/movie_card_info_widget/movie_card_info_widget.dart';
import 'package:movie_test/ui/common_widgets/movie_card_poster_widget/movie_card_info_widget/star_and_rating_widget/start_and_rating_widget.dart';
import 'package:movie_test/ui/common_widgets/text_widget/big_text_widget.dart';
import 'package:movie_test/ui/common_widgets/text_widget/small_text_widget.dart';
import 'package:movie_test/ui/screens/detail_screen/add_to_list_widget.dart';
import 'package:movie_test/ui/screens/detail_screen/detail_screen_banner.dart';

class DetailScreeen extends StatelessWidget {
  const DetailScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const DetailScreenBanner(),
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [StarAndRatingWidget(), AddToListWidget()],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: BigTextWidget(data: 'Angel has fallen'),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'nuenoiuwehnphwhmpihpfiwetmeitpseiurtimpuvwrisve,rmveri hvui hrpmvuhepruh puvehrnpv uhergijv ndfmn gh u ng r r h ruvhruhur hh rg j bj8g jv b fjif vjivjv ji vji viv iviv nifv ij nsutpwyep wew egobfwe wboe gw8toe t7obw378et rw78te ot8w.',
                      style: TextStyle(
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
