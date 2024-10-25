import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePickerModal extends StatefulWidget {
  final Function(bool) onSave;

  TimePickerModal({required this.onSave});

  @override
  _TimePickerModalState createState() => _TimePickerModalState();
}

class _TimePickerModalState extends State<TimePickerModal> {
  late String _alarmTimeString;
  bool _isRepeatSelected = false;
  DateTime? _alarmTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _alarmTimeString = DateFormat('HH:mm').format(_alarmTime!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(children: [
        TextButton(
          onPressed: () async {
            var selectedTime = await showTimePicker(
                context: context, initialTime: TimeOfDay.now());
            if (selectedTime != null) {
              final now = DateTime.now();
              _alarmTime = DateTime(now.year, now.month, now.day,
                  selectedTime.hour, selectedTime.minute);
              setState(() =>
                  _alarmTimeString = DateFormat('HH:mm').format(_alarmTime!));
            }
          },
          child: Text(_alarmTimeString, style: TextStyle(fontSize: 32)),
        ),
        ListTile(
          title: Text('Repeat'),
          trailing: Switch(
              onChanged: (value) => setState(() => _isRepeatSelected = value),
              value: _isRepeatSelected),
        ),
        FloatingActionButton.extended(
          onPressed: () => widget.onSave(_isRepeatSelected),
          icon: Icon(Icons.alarm),
          label: Text('Save'),
        ),
      ]),
    );
  }
}