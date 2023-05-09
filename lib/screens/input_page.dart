import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/resusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/buttom_button.dart';
import '../components/round_icon.dart';
import '../constants.dart';
import '../components/icon_content.dart';
import 'package:bmi_calculator/calculator_brain.dart';

int heighter = 180;
int weight = 80;
int age = 20;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender { male, female }

Color maleColor = inactiveColor;
Color femaleColor = inactiveColor;

Gender selectedGender = Gender.male;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ResusableCard(
                      mycolor: selectedGender == Gender.male
                          ? maleColor = activeColor
                          : maleColor = inactiveColor,
                      cardChild: const IconContent(
                        myicon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ResusableCard(
                      mycolor: selectedGender == Gender.female
                          ? femaleColor = activeColor
                          : femaleColor = inactiveColor,
                      cardChild: const IconContent(
                        myicon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ResusableCard(
                    mycolor: activeColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'HEIGHT',
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              heighter.toString(),
                              style: numberStyle,
                            ),
                            const Text('cm', style: labelTextStyle),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            thumbColor: const Color((0xFFEB1555)),
                            overlayColor: const Color((0x29EB1555)),
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0,
                            ),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 17.0,
                            ),
                          ),
                          child: Slider(
                            value: heighter.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            inactiveColor: const Color(0xFF8D8E98),
                            onChanged: (double newValue) {
                              setState(() {
                                heighter = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ResusableCard(
                    mycolor: activeColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ResusableCard(
                    mycolor: activeColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonlabel: 'CALCULATE',
            onTap: () {
              CalculatorBrain calic =
                  CalculatorBrain(height: heighter, width: weight);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmifigure: calic.CalculateBMI(),
                      bmiText: calic.getResult(),
                      bmiFeed: calic.getFeedback(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
