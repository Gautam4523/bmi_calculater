import 'package:bmi_calculater/screen/input_page.dart';
import 'package:flutter/material.dart';
import '../util/constants.dart';
import '../common/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.getInterPretation,
      required this.resultBmi,
      required this.resultText});

  final String resultBmi;
  final String resultText;
  final String getInterPretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCUTALOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15),
              child: Text(
                'Your Result',
                style: kResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                color: kActiveColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText,
                      style: kRatingTextStyle,
                    ),
                    Text(
                      resultBmi,
                      style: kNumberStyle,
                    ),
                    Text(
                      getInterPretation,
                      style: kBottomTextStyle1,
                    )
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            bottomText: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
