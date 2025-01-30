import 'package:home_assistant/Features/Home/Models/SmartDevice.dart';

class SmartGarage extends SmartDevice {
  bool isUp;
  bool isDown;
  SmartGarage(
    super.deviceId,
    super.name,
    super.image,
    super.roomIndex,
    super.isOn,
    this.isDown,
    this.isUp,
  );

  factory SmartGarage.fromJson(Map<String, dynamic> json) {
    return SmartGarage(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/Smart Garage.png",
      json['roomIndex'],
      json['isOn'],
      json['isUp'],
      json['isDown'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json["isUp"] = isUp;
    json["isDown"] = isDown;
    return json;
  }

  Map<String, dynamic> toMap() {
    return {
      'deviceId': deviceId,
      'name': name,
      'image': image,
      'roomIndex': roomIndex,
      'isOn': isOn ? 1 : 0,
      'isUp': isOn ? 1 : 0,
      'isDown': isOn ? 1 : 0,
    };
  }

  factory SmartGarage.fromMap(Map<String, dynamic> json) {
    return SmartGarage(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/Smart Garage.png",
      json['roomIndex'],
      json['isOn'] == 1,
      json['isUp'] == 1,
      json['isisDownOn'] == 1,
    );
  }
}
