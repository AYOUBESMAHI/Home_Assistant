import 'package:home_assistant/Features/Home/Models/SmartDevice.dart';

class SmartRefrigerator extends SmartDevice {
  bool isDoorOpen;
  int firdgeTemp;
  int freezerTemp;
  CoolingModes coolingMode;
  SmartRefrigerator(
    super.deviceId,
    super.name,
    super.image,
    super.roomIndex,
    super.isOn,
    this.isDoorOpen,
    this.firdgeTemp,
    this.freezerTemp,
    this.coolingMode,
  );

  factory SmartRefrigerator.fromJson(Map<String, dynamic> json) {
    return SmartRefrigerator(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/Smart refrigerator.png",
      json['roomIndex'],
      json['isOn'],
      json['isDoorOpen'],
      json['fridgeTemp'],
      json['freezerTemp'],
      CoolingModes.values[json['coolingModes']],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json["isDoorOpen"] = isDoorOpen;
    json["fridgeTemp"] = firdgeTemp;
    json["freezerTemp"] = freezerTemp;
    json["coolingModes"] = coolingMode.index;

    return json;
  }

  Map<String, dynamic> toMap() {
    return {
      'deviceId': deviceId,
      'name': name,
      'image': image,
      'roomIndex': roomIndex,
      'isOn': isOn ? 1 : 0,
      'isDoorOpen': isDoorOpen ? 1 : 0,
      'fridgeTemp': firdgeTemp,
      'freezerTemp': freezerTemp,
      'coolingMode': coolingMode.index,
    };
  }

  factory SmartRefrigerator.fromMap(Map<String, dynamic> json) {
    return SmartRefrigerator(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/Smart refrigerator.png",
      json['roomIndex'],
      json['isOn'] == 1,
      json["isDoorOpen"] == 1,
      json["fridgeTemp"],
      json["freezerTemp"],
      CoolingModes.values[json['coolingMode']],
    );
  }
}

enum CoolingModes { normal, superCool, superFreeze, custom }
