import 'dart:math';

import 'package:bmi_calculater/modules/bmi_result.dart';
import 'package:bmi_calculater/shared/component/component/item1.dart';
import 'package:bmi_calculater/shared/component/component/item2.dart';
import 'package:bmi_calculater/shared/component/component/style_button.dart';
import 'package:bmi_calculater/shared/component/component/style_font.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double height = 120;
  int agePoint = 20;
  int weightPoint = 60;
  bool isMale = true;

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
          text: 'Bmi Calculate',
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Item1(
                      color: isMale ? Colors.blue : Colors.grey,
                      text: 'Male',
                      image: 'assets/images/male .png',
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: Item1(
                      color: isMale ? Colors.grey : Colors.blue,
                      text: 'Female',
                      image: 'assets/images/female.png',
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyleFont(
                      text: 'Height',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        StyleFont(
                          text: '${height.round()}',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        StyleFont(
                          text: 'Cm',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Slider(
                      activeColor: Colors.blue,
                      thumbColor: Colors.black,
                      min: 5,
                      max: 220,
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Item2(
                      text: 'Age',
                      addPoint: () {
                        addOnePoint('Age');
                      },
                      removePoint: () {
                        if (agePoint > 0) {
                          removeOnePoint('Age');
                        }
                      },
                      stylePoint: '$agePoint',
                    ),
                  ),
                  Expanded(
                    child: Item2(
                      text: 'Weight',
                      addPoint: () {
                        addOnePoint('Weight');
                      },
                      removePoint: () {
                        if (weightPoint > 0) {
                          removeOnePoint('Weight');
                        }
                      },
                      stylePoint: '$weightPoint',
                    ),
                  ),
                ],
              ),
            ),
            StyleButton(
              text: 'Calculate',
              onTap: () {
                var result = weightPoint / pow(height / 100, 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BmiResult(
                        isMale: isMale,
                        age: '$agePoint',
                        result: '${result.round()}',
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void addOnePoint(String name) {
    setState(() {
      if (name == 'Age') {
        agePoint++;
      } else if (name == 'Weight') {
        weightPoint++;
      }
    });
  }

  void removeOnePoint(String name) {
    setState(() {
      if (name == 'Age') {
        agePoint--;
      } else if (name == 'Weight') {
        weightPoint--;
      }
    });
  }
}
