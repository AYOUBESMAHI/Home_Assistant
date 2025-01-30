import 'package:home_assistant/Features/Home/Models/SmartDevice.dart';

class SmartMicrowave extends SmartDevice {
  int temp;
  int time;
  CookingMode cookingMode;
  SmartMicrowave(
    super.deviceId,
    super.name,
    super.image,
    super.roomIndex,
    super.isOn,
    this.temp,
    this.time,
    this.cookingMode,
  );

  factory SmartMicrowave.fromJson(Map<String, dynamic> json) {
    return SmartMicrowave(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/smart microwave.png",
      json['roomIndex'],
      json['isOn'],
      json['temp'],
      json['time'],
      CookingMode.values[json['cookingMode']],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json["temp"] = temp;
    json["time"] = time;
    json["cookingMode"] = cookingMode.index;
    return json;
  }

  Map<String, dynamic> toMap() {
    return {
      'deviceId': deviceId,
      'name': name,
      'image': image,
      'roomIndex': roomIndex,
      'isOn': isOn ? 1 : 0,
      'temp': temp,
      'time': time,
      'cookingMode': cookingMode.index,
    };
  }

  factory SmartMicrowave.fromMap(Map<String, dynamic> json) {
    return SmartMicrowave(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/smart microwave.png",
      json['roomIndex'],
      json['isOn'] == 1,
      json['temp'],
      json['time'],
      CookingMode.values[json['cookingMode']],
    );
  }
}

enum CookingMode {
  chicken,
  steak,
  legs,
  shrimp,
  fries,
  vegetables,
  fish,
  pie,
  custom
}
