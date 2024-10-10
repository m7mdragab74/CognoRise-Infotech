import 'package:bmi_calculator/widgets/round_icon.dart';
import 'package:flutter/material.dart';

class AgeButton extends StatefulWidget {
  const AgeButton({super.key});

  @override
  State<AgeButton> createState() => _AgeButtonState();
}

class _AgeButtonState extends State<AgeButton> {
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff323243),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'AGE',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF8D8E98),
              ),
            ),
            Text(
              age.toString(),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  icon: Icons.remove,
                  onPressed: () {
                    setState(() {
                      age--;
                    });
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                RoundIconButton(
                  icon: Icons.add,
                  onPressed: () {
                    setState(() {
                      age++;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
