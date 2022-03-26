import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_test/routes/routes.dart';
import 'package:movie_test/ui/screens/home_screen/home_screen.dart';
import 'package:movie_test/ui/screens/unknown_screen/unknown_screen.dart';

void main() async {
  runApp(const MovieApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xff0D0F14),
      statusBarColor: Color(0xff0D0F14),
    ),
  );
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: const Color(0xff0D0F14), brightness: Brightness.dark),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: routes[settings.name] ?? (_) => const UnknownPage(),
      ),
      home: const HomeScreen(),
    );
  }
}
