import 'package:flutter/material.dart';
import 'package:movie_test/models/movies.dart';
import 'package:movie_test/routes/route_names.dart';
import 'package:movie_test/services/database_mixin.dart';
import 'package:movie_test/ui/common_widgets/movie_card_poster_widget/movie_card_poster_widget.dart';
import 'package:movie_test/ui/common_widgets/text_widget/big_text_widget.dart';

class MyListWidget extends StatefulWidget {
  const MyListWidget({Key? key}) : super(key: key);

  @override
  State<MyListWidget> createState() => _MyListWidgetState();
}

class _MyListWidgetState extends State<MyListWidget> with DatabaseMixin {
  List<Movie> movieList = [];
  int count = 0;
  @override
  void initState() async {
    await databaseHelper.initializeDatabase();
    movieList = await databaseHelper.getMovieList();
    count = movieList.length;
    super.initState();
  }

  void updateMovieList() async {
    await databaseHelper.initializeDatabase();
    List<Movie> movieList2 = await databaseHelper.getMovieList();
    setState(() {
      movieList = movieList2;
      count = movieList2.length;
    });
  }

  delete(Movie movie) async {
    await databaseHelper.deleteLikedMovie(movie.id!);
    updateMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          margin: const EdgeInsets.only(bottom: 18, top: 15),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: BigTextWidget(data: 'Likes'),
          ),
        ),
        LayoutBuilder(
          builder: ((context, constraints) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: constraints.maxWidth,
                height: 700,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      mainAxisExtent: 300),
                  itemCount: count,
                  itemBuilder: (_, index) => InkWell(
                    onLongPress: () {
                      showAlertDialog(context, 'Delete from list?', delete,
                          movieList[index]);
                    },
                    onTap: () async {
                      var state = await Navigator.pushNamed(
                          context, RouteNames.detailScreen);
                      if (state == true) {
                        updateMovieList();
                      }
                    },
                    child:
                        MovieCardPosterWidget(data: movieList[index].toMap()),
                  ),
                ),
              )),
        )
      ],
    );
  }
}
