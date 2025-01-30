import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Models/SmartDevice.dart';

class RoomsProvider extends ChangeNotifier {
  int? _currentRoomIndex;
  int? get currentRoomIndex => _currentRoomIndex;
  setCurrentRoomIndex(index) => _currentRoomIndex = index;

  Map<String, dynamic>? _selectedDevice;
  Map<String, dynamic>? get selectedDevice => _selectedDevice;
  setSelectedDevice(device) => _selectedDevice = device;

  bool _isLocalInitialized = false;
  bool get isLocalInitialized => _isLocalInitialized;
  setLocalInitialized(value) => _isLocalInitialized = value;

  SmartDevice? _smartDevice;
  SmartDevice? get smartDevice => _smartDevice;
  setSmartDevice(device) => _smartDevice = device;

  List<SmartDevice> _smartDevices = [];
  List<SmartDevice> get smartDevices => _smartDevices;
  setSmartDevices(device) => _smartDevices.add(device);
  removeSmartDevice(SmartDevice device) =>
      _smartDevices.removeWhere((d) => d.deviceId == device.deviceId);
  clearSmartDevices() => _smartDevices.clear();
}
