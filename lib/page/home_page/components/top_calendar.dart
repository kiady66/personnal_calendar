import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class TopCalendar extends StatefulWidget {
  const TopCalendar({Key? key}) : super(key: key);

  @override
  State<TopCalendar> createState() => _TopCalendarState();
}

class _TopCalendarState extends State<TopCalendar> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      initialDate: _selectedDate,
      lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
      firstDate: _selectedDate.subtract(const Duration(days: 365 * 4)),
      locale: 'fr',
      onDateSelected: (DateTime) {
      },
    );
  }
}
