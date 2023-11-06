import 'dart:math';

class BmiCalculator {
  double calculate(
    int weight,
    double height,
  ) {
    double calculateBMI = weight / pow(height / 100, 2);
    return double.parse(calculateBMI.toStringAsFixed(2));
    //return calculateBMI;
  }

  String getResultText(
    int weight,
    double height,
  ) {
    final result = calculate(weight, height);

    if (result < 16) {
      return 'Severe Thinness';
    }
    if (16 <= result && result < 17) {
      return 'Moderate Thinness';
    }
    if (17 <= result && result < 18.5) {
      return 'Mild Thinness';
    }
    if (18.5 <= result && result < 25) {
      return 'Normal';
    }
    if (25 <= result && result < 30) {
      return 'Overweight';
    }
    if (30 <= result && result < 35) {
      return 'Obese Class I';
    }
    if (35 <= result && result < 40) {
      return 'Obese Class II';
    }
    if (result > 40) {
      return 'Obese Class III';
    }
    return 'Calculate again';
  }

  String getInterpretation(
    int weight,
    double height,
  ) {
    final result = calculate(weight, height);
    if (result >= 25) {
      return 'У вас масса тела выше нормы. Старайтесь больше заниматься спортом.';
    } else if (result >= 18.5) {
      return 'У вас нормальная масса тела. Молодец!';
    } else {
      return 'У вас масса тела ниже нормы. Вы можете съесть немного больше.';
    }
  }
}


/* Severe Thinness	< 16	< 0.64
Moderate Thinness	16 - 17	0.64 - 0.68
Mild Thinness	17 - 18.5	0.68 - 0.74
Normal	18.5 - 25	0.74 - 1
Overweight	25 - 30	1 - 1.2
Obese Class I	30 - 35	1.2- 1.4
Obese Class II	35 - 40	1.4 - 1.6
Obese Class III	> 40	> 1.6 */