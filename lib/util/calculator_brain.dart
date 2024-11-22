import 'dart:math';
import 'dart:core';

class CalculatorBrain {
  CalculatorBrain({
    required this.weight,
    required this.height,
  });

  final int height;
  final int weight;
  double? _bmi;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi != null && _bmi! >= 25) {
      return 'OverWeight';
    } else if (_bmi != null && _bmi! > 18) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getInterPretation() {
    if (_bmi != null && _bmi! >= 25) {
      return 'You have higher than normal body weight. Try to more exercise';
    } else if (_bmi != null && _bmi! > 18) {
      return 'You have normal body weight. Good job';
    } else {
      return 'You have higher than normal body weight. You can eat a bit more';
    }
  }
}
