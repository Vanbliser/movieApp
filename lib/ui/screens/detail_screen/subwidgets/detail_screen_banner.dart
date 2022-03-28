import 'package:flutter/material.dart';

class DetailScreenBanner extends StatelessWidget {
  final Map<String, dynamic> data;
  const DetailScreenBanner({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500' + data['posterPath'],
                ),
                fit: BoxFit.fill),
            gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0x00C4C4C4), Color(0xaaC4C4C4)]),
          ),
          child: const AspectRatio(aspectRatio: 5 / 6.5),
        ),
        Positioned(
          left: 10,
          top: 50,
          child: IconButton(
            onPressed: () {
              //Navigator.of(context).pop(true);
              Navigator.pop(context, true);
            },
            icon: const Icon(Icons.arrow_back, size: 30),
          ),
        ),
      ],
    );
  }
}
