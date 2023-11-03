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
  double _currentSliderValue = 170;

  Color inActiveColor = Color(0xFF2E2E3B);
  Color activeColor = Color(0xFF3E4164);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    _buildGender(
                        context: context,
                        icon: FontAwesomeIcons.mars,
                        text: 'Male'.toUpperCase(),
                        color: activeColor),
                    const SizedBox(width: 22),
                    _buildGender(
                        context: context,
                        icon: FontAwesomeIcons.venus,
                        text: 'Female'.toUpperCase(),
                        color: inActiveColor),
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
                          _currentSliderValue.round().toString().toUpperCase(),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('cm'),
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
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 28.0),
                      ),
                      child: Slider(
                        value: _currentSliderValue,
                        max: 250,
                        min: 50,
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
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
                            '60',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
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
                            '60',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
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
    );
  }

  Expanded _buildGender({
    required BuildContext context,
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Expanded(
      child: GestureDetector(
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
          onTap: () {
            print("Pressed");
          }),
    );
  }
}
