import 'package:flutter/material.dart';

import 'package:bmi/widgets/custom_app_bar.dart';
import 'package:bmi/widgets/custom_button.dart';

class ResultScreen extends StatefulWidget {
  final String result;
  final String description;
  final double data;

  const ResultScreen({
    required this.result,
    required this.description,
    required this.data,
    super.key,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(height: 60, title: 'Results'),
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
            CustomButton(onPressed: () {}, text: 'RECALCULATE'),
          ],
        ),
      ),
    );
  }
}
