import 'package:home_assistant/Features/Home/Models/SmartDevice.dart';

class SmartTv extends SmartDevice {
  double volume;
  TvModes tvmode;
  SmartTv(
    super.deviceId,
    super.name,
    super.image,
    super.roomIndex,
    super.isOn,
    this.volume,
    this.tvmode,
  );

  factory SmartTv.fromJson(Map<String, dynamic> json) {
    return SmartTv(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/smartTv.png",
      json['roomIndex'],
      json['isOn'],
      double.parse(json["volume"].toString()),
      TvModes.values[json['tvMode']],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json["tvMode"] = tvmode.index;
    json["volume"] = volume;
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
      'tvMode': tvmode.index,
    };
  }

  factory SmartTv.fromMap(Map<String, dynamic> json) {
    return SmartTv(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/smartTv.png",
      json['roomIndex'],
      json['isOn'] == 1,
      double.parse(json["volume"].toString()),
      TvModes.values[json['tvMode']],
    );
  }
}

enum TvModes { tv, netflix, youtube, google, iptv, games, googlePlay }
