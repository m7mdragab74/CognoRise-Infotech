import 'dart:math';

class BmiLogic {
  final int height;
  final int weight;

  late double _bmi;
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderNormal';
    }
  }

  String getInterPretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight.\n try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight.\n Good job!';
    } else {
      return 'you have a lower than normal body weight';
    }
  }

  BmiLogic(this.height, this.weight);
}
