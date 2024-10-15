import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateHeader extends StatelessWidget {
  DateHeader({super.key});

  final DateTime now = DateTime.now();
  final String formattedDateDay = DateFormat.d().format(DateTime.now());
  final String formattedDateYear = DateFormat.y().format(DateTime.now());
  final String formattedDateMonth = DateFormat.MMM().format(DateTime.now());
  final String formattedDateDayName =
      DateFormat.EEEE().format(DateTime.now()).toUpperCase();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      height: 130,
      color: Colors.blue,
      child: Row(
        children: [
          Text(
            formattedDateDay,
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formattedDateMonth,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                formattedDateYear,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          Text(
            formattedDateDayName,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
