import 'package:flutter/material.dart';

class StyleFont extends StatelessWidget {
  const StyleFont({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.color,
    this.textBaseline,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextBaseline? textBaseline;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        textBaseline: textBaseline,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
