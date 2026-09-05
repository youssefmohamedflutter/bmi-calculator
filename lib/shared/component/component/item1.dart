import 'package:bmi_calculater/shared/component/component/style_font.dart';
import 'package:flutter/material.dart';

class Item1 extends StatelessWidget {
  const Item1({
    super.key,
    required this.color,
    required this.text,
    required this.image,
    required this.onTap,
  });

  final Color color;
  final String text;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(image)),
            StyleFont(
              text: text,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
