import 'package:flutter/material.dart';

import '../home_page/components/home_task.dart';
import '../home_page/components/top_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffe8f1fa),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                  border: Border.all(
                    color: const Color(0xfff5f5f5),
                    width: 5,
                  ),
                ),
                child: const TopCalendar()),
          ),
          Expanded(
              flex: 3,
              child: ListView(
                children: const [
                  HomeTask(
                    'LMS tecnical support',
                    '45 min',
                  ),
                  HomeTask(
                    'LMS tecnical support',
                    '45 min',
                  ),
                  HomeTask(
                    'LMS tecnical support',
                    '45 min',
                  ),
                  HomeTask(
                    'LMS tecnical support',
                    '45 min',
                  ),
                  HomeTask(
                    'LMS tecnical support',
                    '45 min',
                  ),
                  HomeTask(
                    'LMS tecnical support',
                    '45 min',
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
