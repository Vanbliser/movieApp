import 'package:flutter/material.dart';
import 'package:movie_test/models/movies.dart';
import 'package:movie_test/services/database_mixin.dart';
import 'package:movie_test/ui/common_widgets/movie_card_poster_widget/movie_card_poster_widget.dart';
import 'package:movie_test/ui/common_widgets/text_widget/big_text_widget.dart';
import 'package:movie_test/ui/screens/detail_screen/detail_screen.dart';

class MyListWidget extends StatefulWidget {
  const MyListWidget({Key? key}) : super(key: key);

  @override
  State<MyListWidget> createState() => _MyListWidgetState();
}

class _MyListWidgetState extends State<MyListWidget> with DatabaseMixin {
  List<Movie> movieList = [];
  int count = 0;
  @override
  void initState() {
    updateMovieList();
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
          margin: const EdgeInsets.only(bottom: 15, top: 0),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: BigTextWidget(data: 'Likes'),
          ),
        ),
        LayoutBuilder(
          builder: ((context, constraints) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: constraints.maxWidth,
                height: 600,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      mainAxisExtent: 360),
                  itemCount: count,
                  itemBuilder: (_, index) => InkWell(
                    onLongPress: () {
                      showAlertDialog(context, 'Delete from list?', delete,
                          movieList[index]);
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailScreeen(
                                data: (movieList[index]).toMap(),
                                movie: movieList[index]);
                          },
                        ),
                      );
                    },
                    child:
                        MovieCardPosterWidget(data: movieList[index].toMap()),
                  ),
                ),
              )),
        ),
        const SizedBox(height: 60)
      ],
    );
  }
}
