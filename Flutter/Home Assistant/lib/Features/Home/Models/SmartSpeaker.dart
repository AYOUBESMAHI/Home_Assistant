import 'package:home_assistant/Features/Home/Models/SmartDevice.dart';

class SmartSpeaker extends SmartDevice {
  double volume;
  bool isPlaying;
  int indexCurrentSong;
  List<String> playlist;
  SmartSpeaker(
    super.deviceId,
    super.name,
    super.image,
    super.roomIndex,
    super.isOn,
    this.volume,
    this.isPlaying,
    this.indexCurrentSong,
    this.playlist,
  );

  factory SmartSpeaker.fromJson(Map<String, dynamic> json) {
    return SmartSpeaker(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/Smart Speacker.png",
      json['roomIndex'],
      json['isOn'],
      double.parse(json["volume"].toString()),
      json['isPlaying'],
      json['indexCurrentSong'],
      (json['playlist'] as List<dynamic>).cast<String>(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json["volume"] = volume;
    json["isPlaying"] = isPlaying;
    json["indexCurrentSong"] = indexCurrentSong;
    json["playlist"] = playlist;
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
      "isPlaying": isPlaying ? 1 : 0,
      "indexCurrentSong": indexCurrentSong,
      "playlist": playlist.join(','),
    };
  }

  factory SmartSpeaker.fromMap(Map<String, dynamic> json) {
    return SmartSpeaker(
      json["deviceId"],
      json["name"],
      "Assets/Images/Devices/Smart Speacker.png",
      json['roomIndex'],
      json['isOn'] == 1,
      double.parse(json["volume"].toString()),
      json['isPlaying'] == 1,
      json['indexCurrentSong'],
      json['playlist'].split(','),
    );
  }
}
