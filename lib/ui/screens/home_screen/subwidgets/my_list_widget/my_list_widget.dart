import 'package:flutter/material.dart';
import 'package:movie_test/routes/route_names.dart';
//import 'package:movie_test/ui/common_widgets/movie_card_poster_widget/movie_card_poster_widget.dart';
import 'package:movie_test/ui/common_widgets/text_widget/big_text_widget.dart';

class MyListWidget extends StatefulWidget {
  const MyListWidget({Key? key}) : super(key: key);

  @override
  State<MyListWidget> createState() => _MyListWidgetState();
}

class _MyListWidgetState extends State<MyListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          margin: const EdgeInsets.only(bottom: 18, top: 15),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: BigTextWidget(data: 'Likes'),
          ),
        ),
        LayoutBuilder(
          builder: ((context, constraints) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: constraints.maxWidth,
                height: 700,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      mainAxisExtent: 300),
                  itemCount: 6,
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.detailScreen);
                    },
                    //child: MovieCardPosterWidget(),
                  ),
                ),
              )),
        )
      ],
    );
  }
}
