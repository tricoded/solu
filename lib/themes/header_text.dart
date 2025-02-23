import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  TextOverflow overflow;
  
  HeaderText({
    super.key,
    this.color = Colors.black,
    required this.text, 
    this.size = 25,
    this.overflow=TextOverflow.ellipsis
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}