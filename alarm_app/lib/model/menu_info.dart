import 'package:alarm_app/data/enum.dart';
import 'package:flutter/material.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String? title;
  String? imageSource;

  MenuInfo(
    this.menuType, {
    this.title,
    this.imageSource,
  });

  updateMenu(MenuInfo menuInfo) {
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    imageSource = menuInfo.imageSource;

    notifyListeners();
  }
}
