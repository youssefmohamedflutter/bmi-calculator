import 'package:bmi_calculater/shared/component/component/style_font.dart';
import 'package:flutter/material.dart';

class Item2 extends StatelessWidget {
  const Item2({
    super.key,
    required this.text,
    required this.addPoint,
    required this.removePoint,
    required this.stylePoint,
  });

  final String text;
  final String stylePoint;
  final VoidCallback addPoint;
  final VoidCallback removePoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StyleFont(text: text, fontSize: 20, fontWeight: FontWeight.bold),
          StyleFont(
            text: stylePoint,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                mini: true,
                onPressed: addPoint,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.add, size: 25),
              ),
              SizedBox(width: 5),
              FloatingActionButton(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                mini: true,
                onPressed: removePoint,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.remove, size: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
