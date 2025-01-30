class SmartDevice {
  final String deviceId;
  final String name;
  final String image;
  final int roomIndex;
  bool isOn;
  SmartDevice(this.deviceId, this.name, this.image, this.roomIndex, this.isOn);

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'isOn': isOn,
    };
  }
}
