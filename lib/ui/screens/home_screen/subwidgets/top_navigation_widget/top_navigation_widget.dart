import 'package:flutter/material.dart';
import 'package:movie_test/ui/common_widgets/text_widget/small_text_widget.dart';

class TopNavigationWidget extends StatefulWidget {
  final Color movieColor, myListcolor;
  final void Function() setMovieColor, setMyListColor;
  const TopNavigationWidget({
    Key? key,
    required this.setMovieColor,
    required this.setMyListColor,
    required this.movieColor,
    required this.myListcolor,
  }) : super(key: key);

  @override
  State<TopNavigationWidget> createState() => _TopNavigationWidgetState();
}

class _TopNavigationWidgetState extends State<TopNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(const Color(0x11ffffff)),
            ),
            onPressed: widget.setMovieColor,
            child: SmallTextWidget(data: 'Movies', color: widget.movieColor),
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(const Color(0x11ffffff)),
            ),
            onPressed: widget.setMyListColor,
            child: SmallTextWidget(data: 'My List', color: widget.myListcolor),
          )
        ],
      ),
    );
  }
}
