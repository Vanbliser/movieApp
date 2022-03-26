import 'package:flutter/material.dart';
import 'package:movie_test/routes/route_names.dart';
import 'package:movie_test/ui/screens/detail_screen/detail_screen_widget.dart';

Map<String, Output> routes = {
  RouteNames.detailScreen: (_) => const DetailScreeen(),
};
typedef Output = Widget Function(BuildContext);
