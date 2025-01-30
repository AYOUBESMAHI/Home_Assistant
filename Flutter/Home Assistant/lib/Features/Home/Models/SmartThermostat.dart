import 'package:home_assistant/Features/Home/Models/SmartDevice.dart';

class SmartThermostat extends SmartDevice {
  int temperature;
  SmartThermostat(
    super.deviceId,
    super.name,
    super.image,
    super.roomIndex,
    super.isOn,
    this.temperature,
  );

  factory SmartThermostat.fromJson(Map<String, dynamic> json) {
    return SmartThermostat(
        json["deviceId"],
        json["name"],
        "Assets/Images/Devices/thermostatspng.png",
        json['roomIndex'],
        json['isOn'],
        json['temperature']);
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json["temperature"] = temperature;
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
    };
  }

  factory SmartThermostat.fromMap(Map<String, dynamic> json) {
    return SmartThermostat(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/thermostatspng.png",
      json['roomIndex'],
      json['isOn'] == 1,
      json['temperature'],
    );
  }
}
