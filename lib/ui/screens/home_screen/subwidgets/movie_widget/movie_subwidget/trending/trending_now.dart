import 'package:flutter/material.dart';
import 'package:movie_test/models/movies.dart';
import 'package:movie_test/services/movie_app_mixin.dart';
import 'package:movie_test/ui/common_widgets/text_widget/big_text_widget.dart';
import 'package:movie_test/ui/screens/home_screen/subwidgets/movie_widget/movie_subwidget/trending/trending_subwidgets/trending_listview.dart';

List<Widget> trendingNow = const [TrendingNowTitle(), TrendingNowListView()];

class TrendingNowTitle extends StatelessWidget {
  const TrendingNowTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
        top: 20,
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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TrendingMovies>(
      future: loadTrending(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TrendingListView(snapshotData: snapshot.data!);
        } else {
          return const NoTrendingListView();
        }
      },
    );
  }
}
