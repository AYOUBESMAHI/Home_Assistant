import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatTimeOfDay(TimeOfDay time) {
  final now = DateTime.now();
  final dateTime =
      DateTime(now.year, now.month, now.day, time.hour, time.minute);
  return DateFormat('hh:mm a').format(dateTime);
}

TimeOfDay parseTimeOfDay(String timeString) {
  DateFormat format12 = DateFormat('hh:mm a');
  DateTime dateTime = format12.parse(timeString);
  return TimeOfDay.fromDateTime(dateTime);
}
