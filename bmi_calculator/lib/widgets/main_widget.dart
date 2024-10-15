import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  const MainWidget(this.color, this.cardChild, this.onPress, {super.key});

  final Color color;
  final Widget cardChild;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
      ),
    );
  }
}
