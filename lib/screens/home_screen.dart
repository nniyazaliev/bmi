import 'package:bmi/models/client_home_model.dart';
import 'package:bmi/providers/home/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi/app_constants/colors/app_colors.dart';
import 'package:bmi/helpers/app_emuns.dart';
import 'package:bmi/screens/result_screen.dart';
import 'package:bmi/services/bmi_services.dart';
import 'package:bmi/widgets/custom_age_weight.dart';
import 'package:bmi/widgets/custom_app_bar.dart';
import 'package:bmi/widgets/custom_button.dart';
import 'package:bmi/widgets/gender_widget.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _bmiServices = BmiServices();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientHomeModel = ref.watch(homeScreenNotifierProvider);
    final homeScreenNotifier = ref.read(homeScreenNotifierProvider.notifier);

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
                                homeScreenNotifier.changeGender(Gender.male);
                              },
                              icon: FontAwesomeIcons.mars,
                              text: 'Male'.toUpperCase(),
                              color: clientHomeModel.gender == Gender.male
                                  ? AppColors.activeColor
                                  : AppColors.inActiveColor),
                          const SizedBox(width: 22),
                          GenderWidget(
                              onTap: () {
                                homeScreenNotifier.changeGender(Gender.female);
                              },
                              icon: FontAwesomeIcons.venus,
                              text: 'Female'.toUpperCase(),
                              color: clientHomeModel.gender == Gender.female
                                  ? AppColors.activeColor
                                  : AppColors.inActiveColor),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    _buildSlider(
                      context: context,
                      clientHomeModel: clientHomeModel,
                      homeScreenNotifier: homeScreenNotifier,
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        CustomAgeWeight(
                          text: 'WEIGHT',
                          number: clientHomeModel.weight.toString(),
                          increment: () {
                            homeScreenNotifier.incrementWeight();
                          },
                          decrement: () {
                            homeScreenNotifier.decrementWeight();
                          },
                        ),
                        const SizedBox(
                          width: 22,
                        ),
                        CustomAgeWeight(
                          text: 'AGE',
                          number: clientHomeModel.age.toString(),
                          increment: () {
                            homeScreenNotifier.incrementAge();
                          },
                          decrement: () {
                            homeScreenNotifier.decrementAge();
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
                        data: _bmiServices.calculate(
                          clientHomeModel.weight,
                          clientHomeModel.height,
                        ),
                        description: _bmiServices.getInterpretation(
                          clientHomeModel.weight,
                          clientHomeModel.height,
                        ),
                        result: _bmiServices.getResultText(
                          clientHomeModel.weight,
                          clientHomeModel.height,
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

  Widget _buildSlider({
    required BuildContext context,
    required ClientHomeModel clientHomeModel,
    required HomeScreenNotifier homeScreenNotifier,
  }) {
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
                clientHomeModel.height.round().toString().toUpperCase(),
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
              value: clientHomeModel.height,
              max: 250,
              min: 50,
              onChanged: (double value) {
                homeScreenNotifier.changeHeight(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
