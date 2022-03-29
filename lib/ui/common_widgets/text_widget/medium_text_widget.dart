import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class BigTextWidget extends StatelessWidget {
  final String data;
  const BigTextWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: const Color(0xffffffff),
      ),
    );
  }
}
