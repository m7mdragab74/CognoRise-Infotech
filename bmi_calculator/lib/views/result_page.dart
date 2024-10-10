import 'package:bmi_calculator/widgets/calc_button.dart';
import 'package:bmi_calculator/widgets/main_widget.dart';
import 'package:flutter/material.dart';

class ResultBadge extends StatelessWidget {
  const ResultBadge(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff222337),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: MainWidget(
                const Color(0xff323243),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 90,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                  ],
                ),
                () {}),
          ),
          CalcButton(
            title: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
