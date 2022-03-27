import 'package:flutter/material.dart';
import 'package:movie_test/ui/screens/home_screen/subwidgets/movie_widget/movie_subwidget/upcoming/coming_soon.dart';
import 'package:movie_test/ui/screens/home_screen/subwidgets/movie_widget/movie_subwidget/trending/trending_now.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: comingSoon + trendingNow,
    );
  }
}
