import 'dart:developer';

import 'package:bmi/helpers/app_emuns.dart';
import 'package:bmi/screens/result_screen.dart';
import 'package:bmi/services/bmi_services.dart';
import 'package:bmi/widgets/gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  static const Color inActiveColor = Color(0xFF2E2E3B);
  static const Color activeColor = Color(0xFF3E4164);

  var name = 'John';
  dynamic surname = 'Wick';

  @override
  void initState() {
    log('name 1: $name');
    name = 'Jonathan';
    log('name 2: $name');
    log('==============================');
    log('surname 1: $surname');
    surname = 1000000;
    log('surname 2: $surname');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: const Text('BMI calculator'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
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
                                  ? activeColor
                                  : inActiveColor),
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
                                  ? activeColor
                                  : inActiveColor),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: activeColor,
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
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 8.0),
                              overlayColor: Colors.red.withOpacity(0.1),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 28.0),
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
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                              color: activeColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Text('Weight'.toUpperCase()),
                                Text(
                                  weight.toString(),
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(3),
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(3),
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 22,
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            decoration: BoxDecoration(
                              color: activeColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Text('Age'.toUpperCase()),
                                Text(
                                  age.toString(),
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(3),
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(3),
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                shadowColor: Colors.greenAccent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.zero,
                  ),
                ),
                minimumSize: Size(
                  MediaQuery.of(context).size.width,
                  80,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultScreen(
                        result: BmiServices().getResultText(weight, height),
                        description:
                            BmiServices().getInterpretation(weight, height),
                        data: BmiServices().calculate(
                          weight,
                          height,
                        ),
                      );
                    },
                  ),
                );

                /* Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const ResultPage())),
                ); */
              },
              child: Text(
                'Calculate'.toUpperCase(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}
