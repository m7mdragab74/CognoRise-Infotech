import 'package:calculator_app/widget/calculator_button.dart';
import 'package:flutter/material.dart';

class ButtonGrid extends StatelessWidget {
  final Function(String) onButtonClick;
  final bool isDarkMode;

  const ButtonGrid({
    Key? key,
    required this.onButtonClick,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonValues = [
      ["AC", "<", "/", "x"],
      ["7", "8", "9", "-"],
      ["4", "5", "6", "+"],
      ["1", "2", "3", "%"],
      ["0", ".", "="],
    ];

    return Expanded(
      flex: 3, // Allocate space more for the buttons
      child: Column(
        children: buttonValues.map((row) {
          return Expanded(
            child: Row(
              children: row.map((text) {
                return CalculatorButton(
                  text: text,
                  onPressed: () => onButtonClick(text),
                  isOperator: _isOperator(text),
                  isDarkMode: isDarkMode,
                );
              }).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }

  bool _isOperator(String value) {
    return value == "AC" ||
        value == "<" ||
        value == "/" ||
        value == "x" ||
        value == "+" ||
        value == "-" ||
        value == "=" ||
        value == "%";
  }
}
