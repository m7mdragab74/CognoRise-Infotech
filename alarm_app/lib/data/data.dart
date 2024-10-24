import 'package:alarm_app/data/enum.dart';
import 'package:alarm_app/data/theme_data.dart';
import 'package:alarm_app/model/alarm_info.dart';
import 'package:alarm_app/model/menu_info.dart';

List<MenuInfo> menuList = [
  MenuInfo(MenuType.clock,
      title: 'Clock', imageSource: 'assets/images/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: 'Alarm', imageSource: 'assets/images/alarm_icon.png'),
  MenuInfo(MenuType.timer,
      title: 'Timer', imageSource: 'assets/images/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: 'Stopwatch', imageSource: 'assets/images/stopwatch_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(
    DateTime.now().add(
      Duration(hours: 1),
    ),
    description: 'Office',
    gradientColors: GradientColors.sky,
  ),
  AlarmInfo(
    DateTime.now().add(
      Duration(hours: 1),
    ),
    description: 'Sport',
    gradientColors: GradientColors.mango,
  ),
];
