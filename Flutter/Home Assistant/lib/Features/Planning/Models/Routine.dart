import 'package:flutter/material.dart';
import 'package:home_assistant/Utils/Helper_Functions.dart';
import 'package:uuid/uuid.dart';

class Routine {
  String id = Uuid().v4();
  bool isActive = false;
  String title = "Untitled";
  List<String> action = [];
  StartRoutineType? startRoutineType;
  String? startRoutineVoice;
  TimeOfDay? startRoutineTime;
  List<String> days = [];

  Routine(
    this.id,
    this.isActive,
    this.title,
    this.action,
    this.startRoutineType,
    this.startRoutineVoice,
    this.startRoutineTime,
    this.days,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isActive': isActive ? 1 : 0,
      'title': title,
      'action': action.join(','),
      'startRoutineType': startRoutineType?.index,
      'startRoutineVoice': startRoutineVoice,
      'startRoutineTime':
          startRoutineTime != null ? formatTimeOfDay(startRoutineTime!) : null,
      'days': days.join(','),
    };
  }

  static Routine fromMap(Map<String, dynamic> map) {
    return Routine(
      map['id'],
      map['isActive'] == 1,
      map['title'],
      (map['action'] as String).split(','),
      map['startRoutineType'] != null
          ? StartRoutineType.values[map['startRoutineType']]
          : null,
      map['startRoutineVoice'],
      map['startRoutineTime'] != null
          ? parseTimeOfDay(map['startRoutineTime'])
          : null,
      (map['days'] as String).split(','),
    );
  }
}

enum StartRoutineType { voice, time }
