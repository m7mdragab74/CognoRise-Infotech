import 'package:flutter/material.dart';

class GenderIcon extends StatelessWidget {
  const GenderIcon({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
