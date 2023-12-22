import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi/app_constants/colors/app_colors.dart';
import 'package:bmi/helpers/app_emuns.dart';
import 'package:bmi/screens/result_screen.dart';
import 'package:bmi/services/bmi_services.dart';
import 'package:bmi/widgets/custom_age_weight.dart';
import 'package:bmi/widgets/custom_app_bar.dart';
import 'package:bmi/widgets/custom_button.dart';
import 'package:bmi/widgets/gender_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender _gender = Gender.male;
  double height = 170;
  int weight = 42;
  int age = 15;

  final _bmiServices = BmiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(height: 60, title: 'BMI Calculator'),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          GenderWidget(
                              onTap: () {
                                setState(() {
                                  _gender = Gender.male;
                                });
                              },
                              icon: FontAwesomeIcons.mars,
                              text: 'Male'.toUpperCase(),
                              color: _gender == Gender.male
                                  ? AppColors.activeColor
                                  : AppColors.inActiveColor),
                          const SizedBox(width: 22),
                          GenderWidget(
                              onTap: () {
                                setState(() {
                                  _gender = Gender.female;
                                });
                              },
                              icon: FontAwesomeIcons.venus,
                              text: 'Female'.toUpperCase(),
                              color: _gender == Gender.female
                                  ? AppColors.activeColor
                                  : AppColors.inActiveColor),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    _buildSlider(context),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        CustomAgeWeight(
                          text: 'WEIGHT',
                          number: weight.toString(),
                          increment: () {
                            setState(() {
                              weight++;
                            });
                          },
                          decrement: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 22,
                        ),
                        CustomAgeWeight(
                          text: 'AGE',
                          number: age.toString(),
                          increment: () {
                            setState(() {
                              age++;
                            });
                          },
                          decrement: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                  ],
                ),
              ),
            ),
            CustomButton(
              text: 'CALCULATE',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultScreen(
                        result: _bmiServices.getResultText(weight, height),
                        description:
                            _bmiServices.getInterpretation(weight, height),
                        data: _bmiServices.calculate(
                          weight,
                          height,
                        ),
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

  Widget _buildSlider(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.activeColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text('Height'.toUpperCase()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                height.round().toString().toUpperCase(),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text('cm'),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red,
              trackShape: const RectangularSliderTrackShape(),
              trackHeight: 3.0,
              thumbColor: Colors.red,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
              overlayColor: Colors.red.withOpacity(0.1),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
            ),
            child: Slider(
              value: height,
              max: 250,
              min: 50,
              onChanged: (double value) {
                setState(() {
                  height = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
