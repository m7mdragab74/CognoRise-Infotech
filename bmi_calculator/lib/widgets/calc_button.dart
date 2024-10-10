import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({super.key, this.onTap, required this.title});
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: const Color(0xFFCF4D68),
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: 80,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
