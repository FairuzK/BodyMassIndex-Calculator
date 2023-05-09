import 'package:bmi_calculator/screens/input_page.dart';
import 'dart:math';

double _bmi = 25;

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.width});
  final int height;
  final int width;
  // ignore: non_constant_identifier_names
  String CalculateBMI() {
    // ignore: no_leading_underscores_for_local_identifiers
     _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'You\'r Over Weight';
    } else if (_bmi >= 18) {
      return 'Normal Weight';
    } else {
      return 'Gain Weight';
    }
  }

  String getFeedback() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18) {
      return 'You have a normal body weight. Maintain it..';
    } else {
      return 'You have a lower than normal body weight. You can eat abit more ';
    }
  }
}
