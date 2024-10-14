import 'package:calculator_app/constant.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOperator;
  final bool isDarkMode;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isOperator,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: isOperator ? operatorColor : buttonColor,
            padding: const EdgeInsets.all(18),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: isOperator ? orangeColor : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
