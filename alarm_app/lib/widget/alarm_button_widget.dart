import 'package:alarm_app/data/theme_data.dart';
import 'package:alarm_app/widget/time_bicker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddAlarmButton extends StatelessWidget {
  final Function(bool) onSave;
  final int alarmCount;

  AddAlarmButton({required this.onSave, required this.alarmCount});

  @override
  Widget build(BuildContext context) {
    return alarmCount < 5
        ? DottedBorder(
            strokeWidth: 2,
            color: CustomColors.clockOutline,
            borderType: BorderType.RRect,
            radius: Radius.circular(24),
            dashPattern: [5, 4],
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: CustomColors.clockBG,
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                onPressed: () {
                  showModalBottomSheet(
                    useRootNavigator: true,
                    context: context,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24))),
                    builder: (context) => TimePickerModal(onSave: onSave),
                  );
                },
                child: Column(children: <Widget>[
                  Image.asset('assets/images/add_alarm.png', scale: 1.5),
                  SizedBox(height: 8),
                  Text('Add Alarm',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'avenir')),
                ]),
              ),
            ),
          )
        : Center(
            child: Text('Only 5 alarms allowed!',
                style: TextStyle(color: Colors.white)));
  }
}
