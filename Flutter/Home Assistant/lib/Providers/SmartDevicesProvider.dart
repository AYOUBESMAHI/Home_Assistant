import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Models/SmartClock.dart';
import 'package:home_assistant/Features/Home/Models/SmartGarage.dart';
import 'package:home_assistant/Features/Home/Models/SmartLamp.dart';
import 'package:home_assistant/Features/Home/Models/SmartMicrowave.dart';
import 'package:home_assistant/Features/Home/Models/SmartPlug.dart';
import 'package:home_assistant/Features/Home/Models/SmartRefrigerator.dart';
import 'package:home_assistant/Features/Home/Models/SmartSpeaker.dart';
import 'package:home_assistant/Features/Home/Models/SmartThermostat.dart';
import 'package:home_assistant/Features/Home/Models/SmartTv.dart';
import 'package:home_assistant/Features/Home/Models/SmartWasher.dart';
import 'package:home_assistant/Services/DevicesDatabaseHelper.dart';

class SmartDevicesProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final String url = "http://10.0.2.2:8000";

  final List<SmartClock> _smartClocks = [];
  List<SmartClock> get smartClocks => _smartClocks;
  void setSmartClocks(clocks) => _smartClocks.addAll(clocks);
  Future<String?> getSmartClock(password, index) async {
    try {
      var response =
          await _dio.get("$url/smartClock/ByPassword?devicePassword=$password");
      var data = response.data;
      if (data["success"]) {
        SmartClock smartClock = SmartClock.fromJson(data["result"]);
        bool deviceExist =
            smartClocks.indexWhere((g) => g.deviceId == smartClock.deviceId) >=
                0;
        if (smartClock.roomIndex != index) {
          return "This device doesn't exist in this room.";
        }
        if (deviceExist) {
          return "This device already exist";
        }
        await DevicesDatabaseHelper.instance
            .insertSmartClock(smartClock.toMap());
        _smartClocks.add(smartClock);
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      print("GetSmartClock Error => $e");
      return e.toString();
    }
    return null;
  }

  Future<String?> updateSmartClock(SmartClock smartClock) async {
    try {
      var response =
          await _dio.patch("$url/smartClock", data: smartClock.toJson());
      var data = response.data;
      if (data["success"]) {
        await DevicesDatabaseHelper.instance.updateSmartClocks(smartClock);
        int index =
            _smartClocks.indexWhere((c) => c.deviceId == smartClock.deviceId);
        _smartClocks[index] = smartClock;
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      print("updateSmartClock Error => $e");
      return e.toString();
    }
    return null;
  }

  Future<void> removeSmartClock(SmartClock smartClock) async {
    try {
      await DevicesDatabaseHelper.instance
          .deleteSmartClock(smartClock.deviceId);

      _smartClocks.removeWhere((c) => c.deviceId == smartClock.deviceId);
      notifyListeners();
    } catch (e) {
      print("removeSmartClock Error => $e");
    }
  }

  final List<SmartGarage> _smartGarages = [];
  List<SmartGarage> get smartGarages => _smartGarages;
  void setSmartGarages(garages) => smartGarages.addAll(garages);

  Future<String?> getSmarGarage(password, index) async {
    try {
      var response = await _dio
          .get("$url/smartGarage/ByPassword?devicePassword=$password");
      var data = response.data;
      if (data["success"]) {
        SmartGarage smartGarage = SmartGarage.fromJson(data["result"]);
        bool deviceExist = smartGarages
                .indexWhere((g) => g.deviceId == smartGarage.deviceId) >=
            0;
        if (smartGarage.roomIndex != index) {
          return "This device doesn't exist in this room.";
        }
        if (deviceExist) {
          return "This device already exist";
        }
        await DevicesDatabaseHelper.instance
            .insertSmartGarage(smartGarage.toMap());
        _smartGarages.add(smartGarage);
        notifyListeners();
      } else {
        return data["message"];
      }
      //Error Dialog
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> updateSmartGarage(SmartGarage smartGarage) async {
    try {
      var response =
          await _dio.patch("$url/smartGarage", data: smartGarage.toJson());
      var data = response.data;
      if (data["success"]) {
        await DevicesDatabaseHelper.instance.updateSmartGarage(smartGarage);
        int index =
            _smartGarages.indexWhere((c) => c.deviceId == smartGarage.deviceId);
        _smartGarages[index] = smartGarage;
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      print("updateSmartGarage Error => $e");
      return e.toString();
    }
    return null;
  }

  Future<void> removeSmartGarage(SmartGarage smartGarage) async {
    try {
      await DevicesDatabaseHelper.instance
          .deleteSmartGarage(smartGarage.deviceId);

      _smartGarages.removeWhere((c) => c.deviceId == smartGarage.deviceId);
      notifyListeners();
    } catch (e) {
      print("removeSmartGarage Error => $e");
    }
  }

  final List<SmartLamp> _smartLamps = [];
  List<SmartLamp> get smartLamps => _smartLamps;
  void setSmartLamps(lamps) => _smartLamps.addAll(lamps);

  Future<String?> getSmartLamp(password, index) async {
    try {
      var response =
          await _dio.get("$url/smartLamp/ByPassword?devicePassword=$password");
      var data = response.data;
      if (data["success"]) {
        SmartLamp smartLamp = SmartLamp.fromJson(data["result"]);
        bool deviceExist =
            smartLamps.indexWhere((g) => g.deviceId == smartLamp.deviceId) >= 0;
        if (smartLamp.roomIndex != index) {
          return "This device doesn't exist in this room.";
        }
        if (deviceExist) {
          return "This device already exist";
        }
        await DevicesDatabaseHelper.instance.insertSmartLamp(smartLamp.toMap());
        _smartLamps.add(smartLamp);
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> updateSmartLamp(SmartLamp smartLamp) async {
    try {
      var response =
          await _dio.patch("$url/smartLamp", data: smartLamp.toJson());
      var data = response.data;
      if (data["success"]) {
        await DevicesDatabaseHelper.instance.updateSmartLamp(smartLamp);
        int index =
            _smartLamps.indexWhere((c) => c.deviceId == smartLamp.deviceId);
        _smartLamps[index] = smartLamp;
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      print("updateSmartLamp Error => $e");
      return e.toString();
    }
    return null;
  }

  Future<void> removeSmartLamp(SmartLamp smartLamp) async {
    try {
      await DevicesDatabaseHelper.instance.deleteSmartLamp(smartLamp.deviceId);

      _smartLamps.removeWhere((c) => c.deviceId == smartLamp.deviceId);
      notifyListeners();
    } catch (e) {
      print("removeSmartLamp Error => $e");
    }
  }

  final List<SmartRefrigerator> _smartRefrigerators = [];
  List<SmartRefrigerator> get smartRefrigerators => _smartRefrigerators;
  void setSmartRefrigerators(refrigerators) =>
      _smartRefrigerators.addAll(refrigerators);

  Future<String?> getSmartRefrigerator(password, index) async {
    try {
      var response = await _dio
          .get("$url/smartRefrigerator/ByPassword?devicePassword=$password");
      var data = response.data;
      if (data["success"]) {
        SmartRefrigerator smartRefrigerator =
            SmartRefrigerator.fromJson(data["result"]);
        bool deviceExist = smartRefrigerators
                .indexWhere((g) => g.deviceId == smartRefrigerator.deviceId) >=
            0;
        if (smartRefrigerator.roomIndex != index) {
          return "This device doesn't exist in this room.";
        }
        if (deviceExist) {
          return "This device already exist";
        }
        await DevicesDatabaseHelper.instance
            .insertSmartRefrigerator(smartRefrigerator.toMap());
        smartRefrigerators.add(smartRefrigerator);
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> updateSmartRefrigerator(
      SmartRefrigerator smartRefrigerator) async {
    try {
      var response = await _dio.patch("$url/smartRefrigerator",
          data: smartRefrigerator.toJson());
      var data = response.data;
      if (data["success"]) {
        await DevicesDatabaseHelper.instance
            .updateSmartRefrigerator(smartRefrigerator);
        int index = _smartRefrigerators
            .indexWhere((c) => c.deviceId == smartRefrigerator.deviceId);
        _smartRefrigerators[index] = smartRefrigerator;
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      print("updateSmartRefrigerator Error => $e");
      return e.toString();
    }
    return null;
  }

  Future<void> removeSmartRefrigerator(
      SmartRefrigerator smartRefrigerator) async {
    try {
      await DevicesDatabaseHelper.instance
          .deleteSmartRefrigerator(smartRefrigerator.deviceId);

      _smartRefrigerators
          .removeWhere((c) => c.deviceId == smartRefrigerator.deviceId);
      notifyListeners();
    } catch (e) {
      print("removeSmartRefrigerator Error => $e");
    }
  }

  final List<SmartMicrowave> _smartMicrowaves = [];
  List<SmartMicrowave> get smartMicrowaves => _smartMicrowaves;
  void setSmartMicrowaves(microwaves) => _smartMicrowaves.addAll(microwaves);

  Future<String?> getSmartMicrowave(password, index) async {
    try {
      var response = await _dio
          .get("$url/smartMicrowave/ByPassword?devicePassword=$password");
      var data = response.data;
      if (data["success"]) {
        SmartMicrowave smartMicrowave = SmartMicrowave.fromJson(data["result"]);
        bool deviceExist = smartMicrowaves
                .indexWhere((g) => g.deviceId == smartMicrowave.deviceId) >=
            0;
        if (smartMicrowave.roomIndex != index) {
          return "This device doesn't exist in this room.";
        }
        if (deviceExist) {
          return "This device already exist";
        }
        await DevicesDatabaseHelper.instance
            .insertSmartMicrowave(smartMicrowave.toMap());
        _smartMicrowaves.add(smartMicrowave);
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> updateSmartMicrowave(SmartMicrowave smartMicrowave) async {
    try {
      var response = await _dio.patch("$url/smartMicrowave",
          data: smartMicrowave.toJson());
      var data = response.data;
      if (data["success"]) {
        await DevicesDatabaseHelper.instance
            .updateSmartMicrowave(smartMicrowave);
        int index = _smartMicrowaves
            .indexWhere((c) => c.deviceId == smartMicrowave.deviceId);
        _smartMicrowaves[index] = smartMicrowave;
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      print("updateSmartMicrowave Error => $e");
      return e.toString();
    }
    return null;
  }

  Future<void> removeSmartMicrowave(SmartMicrowave smartMicrowave) async {
    try {
      await DevicesDatabaseHelper.instance
          .deleteSmartMicrowave(smartMicrowave.deviceId);

      _smartMicrowaves
          .removeWhere((c) => c.deviceId == smartMicrowave.deviceId);
      notifyListeners();
    } catch (e) {
      print("removeSmartMicrowave Error => $e");
    }
  }

  final List<SmartPlug> _smartPlugs = [];
  List<SmartPlug> get smartPlugs => _smartPlugs;
  void setSmartPlugs(plugs) => _smartPlugs.addAll(plugs);

  Future<String?> getSmartPlug(password, index) async {
    try {
      var response =
          await _dio.get("$url/smartPlug/ByPassword?devicePassword=$password");
      var data = response.data;
      if (data["success"]) {
        SmartPlug smartPlug = SmartPlug.fromJson(data["result"]);
        bool deviceExist =
            smartPlugs.indexWhere((g) => g.deviceId == smartPlug.deviceId) >= 0;
        if (smartPlug.roomIndex != index) {
          return "This device doesn't exist in this room.";
        }
        if (deviceExist) {
          return "This device already exist";
        }
        await DevicesDatabaseHelper.instance.insertSmartPlug(smartPlug.toMap());
        smartPlugs.add(smartPlug);
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> updateSmartPlug(SmartPlug smartPlug) async {
    try {
      var response =
          await _dio.patch("$url/smartPlug", data: smartPlug.toJson());
      var data = response.data;
      if (data["success"]) {
        await DevicesDatabaseHelper.instance.updateSmartPlug(smartPlug);
        int index =
            _smartPlugs.indexWhere((c) => c.deviceId == smartPlug.deviceId);
        _smartPlugs[index] = smartPlug;
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      print("updateSmartPlug Error => $e");
      return e.toString();
    }
    return null;
  }

  Future<void> removeSmartPlug(SmartPlug smartPlug) async {
    try {
      await DevicesDatabaseHelper.instance.deleteSmartPlug(smartPlug.deviceId);

      _smartPlugs.removeWhere((c) => c.deviceId == smartPlug.deviceId);
      notifyListeners();
    } catch (e) {
      print("removeSmartPlug Error => $e");
    }
  }

  final List<SmartSpeaker> _smartSpeakers = [];
  List<SmartSpeaker> get smartSpeakers => _smartSpeakers;
  void setSmartSpeakers(speakers) => _smartSpeakers.addAll(speakers);

  Future<String?> getSmartSpeaker(password, index) async {
    try {
      var response = await _dio
          .get("$url/smartSpeaker/ByPassword?devicePassword=$password");
      var data = response.data;
      if (data["success"]) {
        SmartSpeaker smartSpeaker = SmartSpeaker.fromJson(data["result"]);
        bool deviceExist = smartSpeakers
                .indexWhere((g) => g.deviceId == smartSpeaker.deviceId) >=
            0;
        if (smartSpeaker.roomIndex != index) {
          return "This device doesn't exist in this room.";
        }
        if (deviceExist) {
          return "This device already exist";
        }
        await DevicesDatabaseHelper.instance
            .insertSmartSpeaker(smartSpeaker.toMap());
        smartSpeakers.add(smartSpeaker);
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> updateSmartSpeaker(SmartSpeaker smartSpeaker) async {
    try {
      var response =
          await _dio.patch("$url/smartSpeaker", data: smartSpeaker.toJson());
      var data = response.data;
      if (data["success"]) {
        await DevicesDatabaseHelper.instance.updateSmartSpeaker(smartSpeaker);
        int index = _smartSpeakers
            .indexWhere((c) => c.deviceId == smartSpeaker.deviceId);
        _smartSpeakers[index] = smartSpeaker;
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      print("updateSmartSpeaker Error => $e");
      return e.toString();
    }
    return null;
  }

  Future<void> removeSmartSpeaker(SmartSpeaker smartSpeaker) async {
    try {
      await DevicesDatabaseHelper.instance
          .deleteSmartSpeaker(smartSpeaker.deviceId);

      _smartSpeakers.removeWhere((c) => c.deviceId == smartSpeaker.deviceId);
      notifyListeners();
    } catch (e) {
      print("removeSmartSpeaker Error => $e");
    }
  }

  final List<SmartThermostat> _smartThermostats = [];
  List<SmartThermostat> get smartThermostats => _smartThermostats;
  void setSmartThermostats(thermostats) =>
      _smartThermostats.addAll(thermostats);

  Future<String?> getSmartThermostat(password, index) async {
    try {
      var response = await _dio
          .get("$url/smartThermostat/ByPassword?devicePassword=$password");
      var data = response.data;
      if (data["success"]) {
        SmartThermostat smartThermostat =
            SmartThermostat.fromJson(data["result"]);
        bool deviceExist = _smartThermostats
                .indexWhere((g) => g.deviceId == smartThermostat.deviceId) >=
            0;
        if (smartThermostat.roomIndex != index) {
          return "This device doesn't exist in this room.";
        }
        if (deviceExist) {
          return "This device already exist";
        }
        await DevicesDatabaseHelper.instance
            .insertSmartThermostat(smartThermostat.toMap());
        _smartThermostats.add(smartThermostat);
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> updateSmartThermostat(SmartThermostat smartThermostat) async {
    try {
      var response = await _dio.patch("$url/smartThermostat",
          data: smartThermostat.toJson());
      var data = response.data;
      if (data["success"]) {
        await DevicesDatabaseHelper.instance
            .updateSmartThermostat(smartThermostat);
        int index = _smartThermostats
            .indexWhere((c) => c.deviceId == smartThermostat.deviceId);
        _smartThermostats[index] = smartThermostat;
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      print("updateSmartThermostat Error => $e");
      return e.toString();
    }
    return null;
  }

  Future<void> removeSmartThermostat(SmartThermostat smartThermostat) async {
    try {
      await DevicesDatabaseHelper.instance
          .deleteSmartThermostat(smartThermostat.deviceId);

      _smartThermostats
          .removeWhere((c) => c.deviceId == smartThermostat.deviceId);
      notifyListeners();
    } catch (e) {
      print("removeSmartThermostat Error => $e");
    }
  }

  final List<SmartTv> _smartTvs = [];
  List<SmartTv> get smartTvs => _smartTvs;
  void setSmartTvs(tvs) => _smartTvs.addAll(tvs);

  Future<String?> getSmartTv(password, index) async {
    try {
      var response =
          await _dio.get("$url/smartTv/ByPassword?devicePassword=$password");
      var data = response.data;
      if (data["success"]) {
        SmartTv smartTv = SmartTv.fromJson(data["result"]);
        bool deviceExist =
            smartTvs.indexWhere((g) => g.deviceId == smartTv.deviceId) >= 0;
        if (smartTv.roomIndex != index) {
          return "This device doesn't exist in this room.";
        }
        if (deviceExist) {
          return "This device already exist";
        }
        await DevicesDatabaseHelper.instance.insertSmartTv(smartTv.toMap());
        smartTvs.add(smartTv);
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> updateSmartTv(SmartTv smartTv) async {
    try {
      var response = await _dio.patch("$url/smartTv", data: smartTv.toJson());
      var data = response.data;
      if (data["success"]) {
        await DevicesDatabaseHelper.instance.updateSmartTv(smartTv);
        int index = _smartTvs.indexWhere((c) => c.deviceId == smartTv.deviceId);
        _smartTvs[index] = smartTv;
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      print("updateSmartTv Error => $e");
      return e.toString();
    }
    return null;
  }

  Future<void> removeSmartTv(SmartTv smartTv) async {
    try {
      await DevicesDatabaseHelper.instance.deleteSmartTv(smartTv.deviceId);

      _smartTvs.removeWhere((c) => c.deviceId == smartTv.deviceId);
      notifyListeners();
    } catch (e) {
      print("removeSmarTv Error => $e");
    }
  }

  final List<SmartWasher> _smartWashers = [];
  List<SmartWasher> get smartWashers => _smartWashers;
  void setSmartWashers(washers) => _smartWashers.addAll(washers);

  Future<String?> getSmartWasher(password, index) async {
    try {
      var response = await _dio
          .get("$url/smartWasher/ByPassword?devicePassword=$password");
      var data = response.data;
      if (data["success"]) {
        SmartWasher smartWasher = SmartWasher.fromJson(data["result"]);
        bool deviceExist = smartWashers
                .indexWhere((g) => g.deviceId == smartWasher.deviceId) >=
            0;
        if (smartWasher.roomIndex != index) {
          return "This device doesn't exist in this room.";
        }
        if (deviceExist) {
          return "This device already exist";
        }
        await DevicesDatabaseHelper.instance
            .insertSmartWasher(smartWasher.toMap());
        smartWashers.add(smartWasher);
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> updateSmartWasher(SmartWasher smartWasher) async {
    try {
      var response =
          await _dio.patch("$url/smartWasher", data: smartWasher.toJson());
      var data = response.data;
      if (data["success"]) {
        await DevicesDatabaseHelper.instance.updateSmartWasher(smartWasher);
        int index =
            _smartWashers.indexWhere((c) => c.deviceId == smartWasher.deviceId);
        _smartWashers[index] = smartWasher;
        notifyListeners();
      } else {
        return data["message"];
      }
    } catch (e) {
      print("updateSmartWasher Error => $e");
      return e.toString();
    }
    return null;
  }

  Future<void> removeSmartWasher(SmartWasher smartWasher) async {
    try {
      await DevicesDatabaseHelper.instance
          .deleteSmartWasher(smartWasher.deviceId);

      _smartWashers.removeWhere((c) => c.deviceId == smartWasher.deviceId);
      notifyListeners();
    } catch (e) {
      print("removeSmarWasher Error => $e");
    }
  }
}
