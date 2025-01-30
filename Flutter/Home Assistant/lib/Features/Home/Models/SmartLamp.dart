import 'package:home_assistant/Features/Home/Models/SmartDevice.dart';

class SmartLamp extends SmartDevice {
  String color;
  SmartLamp(
    super.deviceId,
    super.name,
    super.image,
    super.roomIndex,
    super.isOn,
    this.color,
  );

  factory SmartLamp.fromJson(Map<String, dynamic> json) {
    return SmartLamp(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/Smart-Bulb.png",
      json['roomIndex'],
      json['isOn'],
      json['color'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json["color"] = color;
    return json;
  }

  Map<String, dynamic> toMap() {
    return {
      'deviceId': deviceId,
      'name': name,
      'image': image,
      'roomIndex': roomIndex,
      'isOn': isOn ? 1 : 0,
      'color': color,
    };
  }

  factory SmartLamp.fromMap(Map<String, dynamic> json) {
    return SmartLamp(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/Smart-Bulb.png",
      json['roomIndex'],
      json['isOn'] == 1,
      json['color'],
    );
  }
}
