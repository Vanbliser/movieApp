import 'package:flutter/material.dart';
import 'package:movie_test/models/movies.dart';
import 'package:movie_test/services/database_helper.dart';

mixin DatabaseMixin {
  DatabaseHelper databaseHelper = DatabaseHelper();
  void showAlertDialog(BuildContext context, String message,
      void Function(Movie) funct, Movie a) {
    AlertDialog alertDialog = AlertDialog(
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            funct(a);
            Navigator.pop(context);
          },
          child: const Text('Yes', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void errorAlertDialog(BuildContext context, String message) {
    AlertDialog alertDialog = AlertDialog(
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
