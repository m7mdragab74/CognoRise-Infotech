import 'package:alarm_app/data/theme_data.dart';
import 'package:alarm_app/model/alarm_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlarmListItem extends StatelessWidget {
  final AlarmInfo alarm;
  final Function(int?) onDelete;

  const AlarmListItem({super.key, required this.alarm, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    var alarmTime = DateFormat('hh:mm aa').format(alarm.alarmDateTime!);
    var gradientColor =
        GradientTemplate.gradientTemplate[alarm.gradientColorIndex!].colors;
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: gradientColor,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
        boxShadow: [
          BoxShadow(
              color: gradientColor.last.withOpacity(0.4),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(4, 4))
        ],
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              const Icon(Icons.label, color: Colors.white, size: 24),
              const SizedBox(width: 8),
              Text(alarm.title!,
                  style: const TextStyle(
                      color: Colors.white, fontFamily: 'avenir')),
            ]),
            Switch(onChanged: (_) {}, value: true, activeColor: Colors.white),
          ]),
          const Text('Mon-Fri',
              style: TextStyle(color: Colors.white, fontFamily: 'avenir')),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(alarmTime,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700)),
            IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.white,
                onPressed: () => onDelete(alarm.id)),
          ]),
        ],
      ),
    );
  }
}
