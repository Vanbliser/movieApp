import 'package:flutter/material.dart';
import 'package:movie_test/routes/route_names.dart';
import 'package:movie_test/services/movie_app_mixin.dart';
import 'package:movie_test/ui/common_widgets/movie_card_poster_widget/movie_card_poster_widget.dart';
import 'package:movie_test/ui/common_widgets/text_widget/big_text_widget.dart';

List<Widget> trendingNow = const [TrendingNowTitle(), TrendingNowListView()];

class TrendingNowTitle extends StatelessWidget {
  const TrendingNowTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
        top: 40,
        left: 15,
        right: 15,
      ),
      child: const Align(
          alignment: Alignment.centerLeft,
          child: BigTextWidget(data: 'Trending now')),
    );
  }
}

class TrendingNowListView extends StatefulWidget {
  const TrendingNowListView({Key? key}) : super(key: key);

  @override
  State<TrendingNowListView> createState() => _TrendingNowListViewState();
}

class _TrendingNowListViewState extends State<TrendingNowListView>
    with MoviePageMixin {
  late final int count;
  @override
  void initState() {
    loadMovies();
    count = 5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      width: MediaQuery.of(context).size.width,
      height: 320,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 7.5),
        scrollDirection: Axis.horizontal,
        itemCount: count,
        itemBuilder: (_, index) => InkWell(
          onTap: () {
            Navigator.pushNamed(context, RouteNames.detailScreen);
          },
          child: const MovieCardPosterWidget(),
        ),
      ),
    );
  }
}
