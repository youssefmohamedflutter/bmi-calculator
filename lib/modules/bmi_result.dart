import 'package:flutter/material.dart';

import '../shared/component/component/style_font.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({
    super.key,
    required this.isMale,
    required this.age,
    required this.result,
  });

  final bool isMale;
  final String age;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(16),
            bottomStart: Radius.circular(16),
          ),
        ),
        title: StyleFont(
          text: 'Bmi Result',
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyleFont(
              text: 'Gender : ${isMale ? 'Male' : 'Female'}',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            StyleFont(
              text: 'Age : $age',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            StyleFont(
              text: 'Result : $result',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            StyleFont(
              text: 'Category : ${getCategory(int.parse(result))}',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  String getCategory(int bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }
}
