import 'package:flutter/material.dart';
import 'package:movie_test/routes/route_names.dart';
import 'package:movie_test/ui/common_widgets/text_widget/big_text_widget.dart';

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
          margin: const EdgeInsets.only(bottom: 20, top: 15),
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
  const ComingSoonPageView({
    Key? key,
  }) : super(key: key);

  @override
  State<ComingSoonPageView> createState() => _ComingSoonPageViewState();
}

class _ComingSoonPageViewState extends State<ComingSoonPageView> {
  late final int count;
  @override
  void initState() {
    count = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: 9 / 4.5,
        child: PageView.builder(
          itemCount: 5,
          itemBuilder: (_, index) => InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.detailScreen);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              clipBehavior: Clip.hardEdge,
              //child: const Image(image: AssetImage('assets/image/image.jpg')),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0x44C4C4C4),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
