import 'package:flutter/material.dart';

class DetailScreenBanner extends StatefulWidget {
  const DetailScreenBanner({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailScreenBanner> createState() => _DetailScreenBannerState();
}

class _DetailScreenBannerState extends State<DetailScreenBanner> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0x00C4C4C4), Color(0xaaC4C4C4)]),
            //colors: [Color(0x00C4C4C4), Color(0xaaC4C4C4)
          ),
          child: const AspectRatio(aspectRatio: 1 / 1.23),
        ),
        Positioned(
          left: 10,
          top: 50,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, size: 30),
          ),
        ),
      ],
    );
  }
}
