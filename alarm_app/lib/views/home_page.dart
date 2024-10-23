import 'package:alarm_app/views/clock_view.dart';
import 'package:alarm_app/widget/build_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezone = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (timezone.startsWith('_')) {
      offsetSign = '+';
    }
    print(timezone);
    return Scaffold(
      backgroundColor: Color(0xff2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildMenuButton(
                title: 'Clock',
                image: 'assets/images/clock_icon.png',
              ),
              BuildMenuButton(
                title: 'Alarm',
                image: 'assets/images/alarm_icon.png',
              ),
              BuildMenuButton(
                title: 'Stopwatch',
                image: 'assets/images/stopwatch_icon.png',
              ),
              BuildMenuButton(
                title: 'Timer',
                image: 'assets/images/timer_icon.png',
              ),
            ],
          ),
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      'Clock',
                      style: TextStyle(
                        fontFamily: 'avenir',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedTime,
                          style: TextStyle(
                            fontFamily: 'avenir',
                            color: Colors.white,
                            fontSize: 64,
                          ),
                        ),
                        Text(
                          formattedDate,
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Align(
                      alignment: Alignment.center,
                      child: ClockView(
                        size: MediaQuery.of(context).size.height / 4,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Timezone',
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'EGY ' + offsetSign + timezone,
                              style: TextStyle(
                                fontFamily: 'avenir',
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
