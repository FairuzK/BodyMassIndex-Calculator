import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/resusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/buttom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.bmifigure,
      required this.bmiText,
      required this.bmiFeed});
  final String bmifigure;
  final String bmiText;
  final String bmiFeed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IBM CALCULATOR'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Your results',
                  style: calHeader,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ResusableCard(
                mycolor: activeColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bmiText.toUpperCase(),
                      style: resultHead,
                    ),
                    Text(
                      bmifigure,
                      style: resultText,
                    ),
                    Text(
                      bmiFeed,
                      textAlign: TextAlign.center,
                      style: resultFeedback,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                buttonlabel: 'RE-CALCULATE')
          ]),
    );
  }
}
