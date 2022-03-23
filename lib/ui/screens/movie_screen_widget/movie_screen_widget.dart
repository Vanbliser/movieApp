import 'package:flutter/material.dart';
import 'package:movie_test/ui/screens/movie_screen_widget/subwidget/coming_soon.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: const [ComingSoon()]),
    );
  }
}
