import 'package:alarm_app/model/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildMenuButton(MenuInfo currentMenuInfo) {
  return Consumer<MenuInfo>(
    builder: (BuildContext context, MenuInfo value, Widget? child) {
      return MaterialButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
        color: currentMenuInfo.menuType == value.menuType
            ? Colors.red
            : Colors.transparent,
        onPressed: () {
          var menuInfo = Provider.of<MenuInfo>(context, listen: false);
          menuInfo.updateMenu(currentMenuInfo);
        },
        child: Column(
          children: <Widget>[
            Image.asset(
              currentMenuInfo.imageSource!,
              scale: 1.5,
            ),
            const SizedBox(height: 16),
            Text(
              currentMenuInfo.title ?? '',
              style: const TextStyle(
                  fontFamily: 'avenir', color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      );
    },
  );
}
