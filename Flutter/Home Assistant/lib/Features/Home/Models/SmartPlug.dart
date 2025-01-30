import 'package:home_assistant/Features/Home/Models/SmartDevice.dart';

class SmartPlug extends SmartDevice {
  double usageKw;
  SmartPlug(
    super.deviceId,
    super.name,
    super.image,
    super.roomIndex,
    super.isOn,
    this.usageKw,
  );

  factory SmartPlug.fromJson(Map<String, dynamic> json) {
    return SmartPlug(
        json["deviceId"],
        json["name"],
        "Assets/Images/Devices/Smart plugs.png",
        json['roomIndex'],
        json['isOn'],
        json['usageKw']);
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json["usageKw"] = usageKw;
    return json;
  }

  Map<String, dynamic> toMap() {
    return {
      'deviceId': deviceId,
      'name': name,
      'image': image,
      'roomIndex': roomIndex,
      'isOn': isOn ? 1 : 0,
      'usageKw': usageKw,
    };
  }

  factory SmartPlug.fromMap(Map<String, dynamic> json) {
    return SmartPlug(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/Smart plugs.png",
      json['roomIndex'],
      json['isOn'] == 1,
      json['usageKw'],
    );
  }
}
