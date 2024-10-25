import 'package:alarm_app/data/theme_data.dart';
import 'package:alarm_app/helper/alarm_helper.dart';
import 'package:alarm_app/model/alarm_info.dart';
import 'package:alarm_app/widget/alarm_button_widget.dart';
import 'package:alarm_app/widget/alarm_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late DateTime _alarmTime;
  late AlarmHelper _alarmHelper;
  Future<List<AlarmInfo>>? _alarms;
  List<AlarmInfo> _currentAlarms = [];
  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    _alarmHelper = AlarmHelper();
    _alarmTime = DateTime.now();

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const androidInitSettings = AndroidInitializationSettings('codex_logo');
    final iOSInitSettings = DarwinInitializationSettings();
    final initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iOSInitSettings,
    );

    flutterLocalNotificationsPlugin.initialize(initSettings).then((_) {
      _alarmHelper.initializeDatabase().then((_) {
        loadAlarms();
      }).catchError((error) {
        print('Error initializing database: $error');
      });
    }).catchError((error) {
      print('Error initializing notifications plugin: $error');
    });
  }

  void loadAlarms() {
    _alarms = _alarmHelper.getAlarms();
    if (mounted) setState(() {});
  }

  void scheduleAlarm(DateTime scheduledDateTime, AlarmInfo alarmInfo,
      {required bool isRepeating}) async {
    var androidDetails = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      channelDescription: 'Channel for Alarm notification',
      icon: 'codex_logo',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
    );

    var iOSDetails = DarwinNotificationDetails(
      sound: 'a_long_cold_sting.wav',
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    var platformDetails =
        NotificationDetails(android: androidDetails, iOS: iOSDetails);

    if (isRepeating) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Office',
        alarmInfo.title,
        tz.TZDateTime.now(tz.local).add(Duration(
            hours: scheduledDateTime.hour, minutes: scheduledDateTime.minute)),
        platformDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } else {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Office',
        alarmInfo.title,
        tz.TZDateTime.from(scheduledDateTime, tz.local),
        platformDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }

  void onSaveAlarm(bool _isRepeating) {
    DateTime scheduleAlarmDateTime;
    if (_alarmTime.isAfter(DateTime.now()))
      scheduleAlarmDateTime = _alarmTime;
    else
      scheduleAlarmDateTime = _alarmTime.add(Duration(days: 1));

    var alarmInfo = AlarmInfo(
      alarmDateTime: scheduleAlarmDateTime,
      gradientColorIndex: _currentAlarms.length,
      title: 'alarm',
    );
    _alarmHelper.insertAlarm(alarmInfo);
    scheduleAlarm(scheduleAlarmDateTime, alarmInfo, isRepeating: _isRepeating);
    Navigator.pop(context);
    loadAlarms();
  }

  void deleteAlarm(int? id) {
    if (id != null) {
      _alarmHelper.delete(id);
      loadAlarms();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Alarm',
            style: TextStyle(
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700,
              color: CustomColors.primaryTextColor,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder<List<AlarmInfo>>(
                    future: _alarms,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error loading alarms'));
                      } else if (snapshot.hasData &&
                          snapshot.data!.isNotEmpty) {
                        _currentAlarms = snapshot.data!;
                        return ListView(
                          children: _currentAlarms
                              .map((alarm) => AlarmListItem(
                                  alarm: alarm, onDelete: deleteAlarm))
                              .toList(),
                        );
                      }
                      return Center(
                          child: Text('No alarms set',
                              style: TextStyle(color: Colors.white)));
                    },
                  ),
                ),
                AddAlarmButton(
                    onSave: onSaveAlarm, alarmCount: _currentAlarms.length),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
