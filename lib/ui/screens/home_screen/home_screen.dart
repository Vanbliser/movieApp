import 'package:flutter/material.dart';
import 'package:movie_test/ui/common_widgets/top_navigation_widget/top_navigation_widget.dart';
import 'package:movie_test/ui/screens/movie_screen_widget//movie_screen_widget.dart';
import 'package:movie_test/ui/screens/my_list_screen_widget/my_list_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget content;
  late Color movieColor, myListcolor;
  late bool movieState, myListState;
  @override
  void initState() {
    movieState = true;
    myListState = false;
    movieColor = const Color(0xffF3AC4A);
    myListcolor = const Color(0xffffffff);
    content = const MovieScreen();
    super.initState();
  }

  void setMovieState() {
    if (movieState == false) {
      setState(() {
        movieState = true;
        myListState = false;
        movieColor = const Color(0xffF3AC4A);
        myListcolor = const Color(0xffffffff);
        content = const MovieScreen();
      });
    }
  }

  void setMyListState() {
    if (myListState == false) {
      setState(() {
        movieState = false;
        myListState = true;
        movieColor = const Color(0xffffffff);
        myListcolor = const Color(0xffF3AC4A);
        content = const MyListScreen();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TopNavigationWidget(
              setMovieColor: setMovieState,
              setMyListColor: setMyListState,
              movieColor: movieColor,
              myListcolor: myListcolor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: content,
          ),
        ],
      ),
    ));
  }
}
