import 'dart:developer';

import 'package:bmi/bmi_calculator.dart';
import 'package:bmi/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff1d2136),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff1D2136),
          primary: const Color(0xFF9BA9EC),
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.poppins(
            fontSize: 20,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 18,
          ),
          displaySmall: GoogleFonts.poppins(),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void bulFun() {
    //1
    //2
    //3
  }

  String fun1() {
    return 'text';
  }

  String fun2() {
    //1
    //2
    //3
    return 'result';
  }

  String fun3() {
    return fun1();
  }

  Color inActiveColor = const Color(0xFF2E2E3B);
  Color activeColor = const Color(0xFF3E4164);

  //tandalty == 0 is Male,tandaldy == 1 is Female
  int tandaldy = 1;

  Jynys jynys = Jynys.ayal;

  double height = 170;
  int weight = 42;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: Center(child: Text(widget.title)),
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
                          _buildGender(
                              onTap: () {
                                log('Erkek tandaldy');
                                setState(() {
                                  jynys = Jynys.erkek;
                                });
                              },
                              context: context,
                              icon: FontAwesomeIcons.mars,
                              text: 'Male'.toUpperCase(),
                              color: jynys == Jynys.erkek
                                  ? activeColor
                                  : inActiveColor),
                          const SizedBox(width: 22),
                          _buildGender(
                              onTap: () {
                                log('Ayal tandaldy');
                                setState(() {
                                  jynys = Jynys.ayal;
                                });
                              },
                              context: context,
                              icon: FontAwesomeIcons.venus,
                              text: 'Female'.toUpperCase(),
                              color: jynys == Jynys.ayal
                                  ? activeColor
                                  : inActiveColor),
                        ],
                      ),
                    ),
                    SizedBox(height: 22),
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
                    SizedBox(height: 22),
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
                                  style: TextStyle(
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
                                  style: TextStyle(
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
                    SizedBox(height: 22),
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
                      return ResultPage(
                        result: BmiCalculator().getResultText(weight, height),
                        description:
                            BmiCalculator().getInterpretation(weight, height),
                        data: BmiCalculator().calculate(
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //SizedBox(height: 22),
          ],
        ),
      ),
    );
  }

  Expanded _buildGender({
    required BuildContext context,
    required IconData icon,
    required String text,
    required Color color,
    required Function() onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                icon,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(text),
              ),
            ],
          ),
        ),
        /* style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            fixedSize: const Size(double.infinity, 270),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ), */
      ),
    );
  }
}

enum Jynys { erkek, ayal }

enum Tus {
  ak,
  kara,
  kok,
  tigibu,
}
