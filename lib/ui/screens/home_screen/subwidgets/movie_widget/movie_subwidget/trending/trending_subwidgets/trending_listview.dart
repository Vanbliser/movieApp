import 'package:flutter/material.dart';
import 'package:movie_test/models/movies.dart';
import 'package:movie_test/ui/common_widgets/movie_card_poster_widget/movie_card_poster_widget.dart';
import 'package:movie_test/ui/screens/detail_screen/detail_screen.dart';

class TrendingListView extends StatelessWidget {
  final TrendingMovies snapshotData;
  final int? count;
  const TrendingListView({Key? key, this.count = 3, required this.snapshotData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 360,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 7.5),
        scrollDirection: Axis.horizontal,
        itemCount: snapshotData.length,
        itemBuilder: (_, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => DetailScreeen(
                  data: snapshotData.list[index],
                  movie: snapshotData.movielist[index],
                ),
              ),
            );
            // Navigator.pushNamed(context, RouteNames.detailScreen,
            //     arguments: snapshotData.list[index]);
          },
          child: MovieCardPosterWidget(data: snapshotData.list[index]),
        ),
      ),
    );
  }
}

class NoTrendingListView extends StatelessWidget {
  const NoTrendingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 7.5),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (_, index) => Column(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7.5),
            width: MediaQuery.of(context).size.width / 2.2,
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0x44C4C4C4),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                color: Color(0xff0D0F14),
              ),
            ),
          ),
          const SizedBox(height: 40)
        ]),
      ),
    );
  }
}
