import 'package:home_assistant/Features/Home/Models/SmartDevice.dart';

class SmartWasher extends SmartDevice {
  int temperature;
  SpeedLevel speedLevel;
  SoilLevel soilLevel;
  WashingModes washingMode;
  SmartWasher(
    super.deviceId,
    super.name,
    super.image,
    super.roomIndex,
    super.isOn,
    this.temperature,
    this.speedLevel,
    this.soilLevel,
    this.washingMode,
  );

  factory SmartWasher.fromJson(Map<String, dynamic> json) {
    return SmartWasher(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/washing machine.png",
      json['roomIndex'],
      json['isOn'],
      json['temperature'],
      SpeedLevel.values[json['speedLevel']],
      SoilLevel.values[json['soilLevel']],
      WashingModes.values[json['washingMode']],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json["temperature"] = temperature;
    json["speedLevel"] = speedLevel.index;
    json["soilLevel"] = soilLevel.index;
    json["washingMode"] = washingMode.index;
    return json;
  }

  Map<String, dynamic> toMap() {
    return {
      'deviceId': deviceId,
      'name': name,
      'image': image,
      'roomIndex': roomIndex,
      'isOn': isOn ? 1 : 0,
      'temperature': temperature,
      'speedLevel': speedLevel.index,
      'soilLevel': soilLevel.index,
      'washingMode': washingMode.index,
    };
  }

  factory SmartWasher.fromMap(Map<String, dynamic> json) {
    return SmartWasher(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/washing machine.png",
      json['roomIndex'],
      json['isOn'] == 1,
      json['temperature'],
      SpeedLevel.values[json['speedLevel']],
      SoilLevel.values[json['soilLevel']],
      WashingModes.values[json['washingMode']],
    );
  }
}

enum SpeedLevel {
  low,
  medium,
  hight,
  veryhight,
}

enum SoilLevel {
  na,
  light,
  normal,
  heavy,
}

enum WashingModes {
  standard,
  delicate,
  quick,
  heavyDuty,
  eco,
  spin,
  rinse,
  steam,
  wool,
  custom
}
