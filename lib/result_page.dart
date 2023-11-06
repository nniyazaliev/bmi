import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final String result;
  final String description;
  final double data;

  //const ResultPage({Key? key}) : super(key: key);
  //const ResultPage({super.key});
  const ResultPage({
    required this.result,
    required this.description,
    required this.data,
    super.key,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.result),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(widget.data.toString()),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    widget.description,
                    textAlign: TextAlign.center,
                  ),
                ],
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
              onPressed: () {},
              child: Text(
                'ReCalculate'.toUpperCase(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
