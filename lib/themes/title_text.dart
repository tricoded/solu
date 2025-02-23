import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  TextOverflow overflow;
  
  TitleText({
    super.key,
    this.color = Colors.black,
    required this.text, 
    this.size = 35,
    this.overflow=TextOverflow.ellipsis
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w900,
        fontSize: size,
      ),
    );
  }
}