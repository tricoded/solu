import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  double lineSpace;
  
  BodyText({
    super.key,
    this.color = Colors.black,
    required this.text, 
    this.size = 13,
    this.lineSpace = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        color: color,
        fontSize: size,
        height: lineSpace,
      )
    );
  }
}