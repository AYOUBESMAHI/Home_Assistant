import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Models/SmartDevice.dart';

class SmartClock extends SmartDevice {
  double volume;
  TimeOfDay? alarm;
  SmartClock(
    super.deviceId,
    super.name,
    super.image,
    super.roomIndex,
    super.isOn,
    this.volume,
    this.alarm,
  );

  factory SmartClock.fromJson(Map<String, dynamic> json) {
    return SmartClock(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/Smart Clock.png",
      json['roomIndex'],
      json['isOn'],
      double.parse(json["volume"].toString()),
      json['alarm'] != null
          ? TimeOfDay.fromDateTime(DateTime.parse(json['alarm']))
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json["volume"] = volume;
    var now = DateTime.now();
    json["alarm"] = alarm != null
        ? DateTime(now.year, now.month, now.day, alarm!.hour, alarm!.minute)
            .toIso8601String()
        : null;
    return json;
  }

  Map<String, dynamic> toMap() {
    return {
      'deviceId': deviceId,
      'name': name,
      'image': image,
      'roomIndex': roomIndex,
      'isOn': isOn ? 1 : 0,
      'volume': volume,
      'alarmHour': alarm?.hour,
      'alarmMinute': alarm?.minute,
    };
  }

  factory SmartClock.fromMap(Map<String, dynamic> map) {
    return SmartClock(
      map['deviceId'],
      map['name'],
      map['image'],
      map['roomIndex'],
      map['isOn'] == 1,
      map['volume'],
      (map['alarmHour'] != null && map['alarmMinute'] != null)
          ? TimeOfDay(hour: map['alarmHour'], minute: map['alarmMinute'])
          : null,
    );
  }
}
