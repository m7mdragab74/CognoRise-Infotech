import 'dart:async';
import 'dart:math';

import 'package:alarm_app/widget/clock_painter.dart';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  final double size;
  ClockView({super.key, required this.size});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}
