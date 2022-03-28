import 'package:flutter/material.dart';
import 'package:movie_test/models/movies.dart';
import 'package:movie_test/services/database_mixin.dart';

class AddToListWidget extends StatefulWidget {
  final Map<String, dynamic> data;
  final Movie movie;
  const AddToListWidget({Key? key, required this.data, required this.movie})
      : super(key: key);

  @override
  State<AddToListWidget> createState() => _AddToListWidgetState();
}

class _AddToListWidgetState extends State<AddToListWidget> with DatabaseMixin {
  save(Movie movie) async {
    await databaseHelper.insertLikedMovie(movie);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Center(child: Icon(Icons.add, size: 14)),
        ),
        const SizedBox(width: 5),
        IconButton(
          onPressed: (() async {
            if (await databaseHelper.checkduplicate(widget.movie.toMap()) ==
                false) {
              showAlertDialog(
                  context, 'Save movie to list?', save, widget.movie);
            } else {
              errorAlertDialog(context, 'Already saved');
            }
          }),
          iconSize: 20,
          icon: Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: const ImageIcon(AssetImage('assets/image/send.png')),
          ),
        )
      ],
    );
  }
}
