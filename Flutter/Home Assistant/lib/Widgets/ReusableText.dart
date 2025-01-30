import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reusabletext extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  const Reusabletext(this.text, this.fontWeight, this.color, this.size,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.spaceMono(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
      softWrap: true,
    );
  }
}
