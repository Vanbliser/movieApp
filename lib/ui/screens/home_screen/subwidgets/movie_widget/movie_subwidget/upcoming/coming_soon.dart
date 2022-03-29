import 'package:flutter/material.dart';
import 'package:movie_test/models/movies.dart';
import 'package:movie_test/services/movie_app_mixin.dart';
import 'package:movie_test/ui/common_widgets/text_widget/big_text_widget.dart';
import 'package:movie_test/ui/screens/home_screen/subwidgets/movie_widget/movie_subwidget/upcoming/upcoming_subwidget/upcoming_pageview.dart';

List<Widget> comingSoon = const [ComingSoonTitle(), ComingSoonPageView()];

class ComingSoonTitle extends StatelessWidget {
  const ComingSoonTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          margin: const EdgeInsets.only(bottom: 10),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: BigTextWidget(data: 'Coming Soon'),
          ),
        ),
      ],
    );
  }
}

class ComingSoonPageView extends StatefulWidget {
  const ComingSoonPageView({Key? key}) : super(key: key);

  @override
  State<ComingSoonPageView> createState() => _ComingSoonPageViewState();
}

class _ComingSoonPageViewState extends State<ComingSoonPageView>
    with MoviePageMixin {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UpComingMovies>(
      future: loadUpComing(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return UpComingPageView(snapshotData: snapshot.data!);
        } else {
          return const NoPageView();
        }
      },
    );
  }
}
