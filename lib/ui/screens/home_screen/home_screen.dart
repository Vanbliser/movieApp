import 'package:flutter/material.dart';
import 'package:movie_test/ui/screens/home_screen/subwidgets/movie_widget/movie_widget.dart';
import 'package:movie_test/ui/screens/home_screen/subwidgets/my_list_widget/my_list_widget.dart';
import 'package:movie_test/ui/screens/home_screen/subwidgets/top_navigation_widget/top_navigation_widget.dart';

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
    content = const MovieWidget();
    super.initState();
  }

  void setMovieState() {
    if (movieState == false) {
      setState(() {
        movieState = true;
        myListState = false;
        movieColor = const Color(0xffF3AC4A);
        myListcolor = const Color(0xffffffff);
        content = const MovieWidget();
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
        content = const MyListWidget();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0D0F14),
        elevation: 0,
        toolbarHeight: 65,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TopNavigationWidget(
            setMovieColor: setMovieState,
            setMyListColor: setMyListState,
            movieColor: movieColor,
            myListcolor: myListcolor,
          ),
        ),
      ),
      body: SingleChildScrollView(child: content),
    );
  }
}
