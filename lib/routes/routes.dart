import 'package:flutter/material.dart';
import 'package:movie_test/routes/route_names.dart';
import 'package:movie_test/ui/screens/detail_screen_widget/detail_screen_widget.dart';
import 'package:movie_test/ui/screens/movie_screen_widget/movie_screen_widget.dart';
import 'package:movie_test/ui/screens/my_list_screen_widget/my_list_screen_widget.dart';

Map<String, Output> routes = {
  RouteNames.movieScreen: (_) => const MovieScreen(),
  RouteNames.detailScreen: (_) => const DetailScreeen(),
  RouteNames.myListScreen: (_) => const MyListScreen(),
};
typedef Output = Widget Function(BuildContext);
