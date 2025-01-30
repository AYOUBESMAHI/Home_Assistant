import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Models/SmartGarage.dart';
import 'package:home_assistant/Providers/RoomsProvider.dart';
import 'package:home_assistant/Providers/SmartDevicesProvider.dart';
import 'package:home_assistant/Utils/Constants.dart';
import 'package:home_assistant/Widgets/ReusableText.dart';
import 'package:provider/provider.dart';

import '../Models/SmartClock.dart';
import '../Models/SmartLamp.dart';
import '../Models/SmartMicrowave.dart';
import '../Models/SmartPlug.dart';
import '../Models/SmartRefrigerator.dart';
import '../Models/SmartSpeaker.dart';
import '../Models/SmartThermostat.dart';
import '../Models/SmartTv.dart';
import '../Models/SmartWasher.dart';
import '../Widgets/AddDeviceBtn.dart';
import '../Widgets/GridDeivceCard.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final roomDevices = [];

  void setRoomDevices(context, index) {
    roomDevices.clear();
    roomDevices.addAll(Provider.of<SmartDevicesProvider>(context)
        .smartClocks
        .where((s) => s.roomIndex == index));
    roomDevices.addAll(Provider.of<SmartDevicesProvider>(context)
        .smartGarages
        .where((s) => s.roomIndex == index));
    roomDevices.addAll(Provider.of<SmartDevicesProvider>(context)
        .smartLamps
        .where((s) => s.roomIndex == index));
    roomDevices.addAll(Provider.of<SmartDevicesProvider>(context)
        .smartMicrowaves
        .where((s) => s.roomIndex == index));
    roomDevices.addAll(Provider.of<SmartDevicesProvider>(context)
        .smartPlugs
        .where((s) => s.roomIndex == index));
    roomDevices.addAll(Provider.of<SmartDevicesProvider>(context)
        .smartThermostats
        .where((s) => s.roomIndex == index));
    roomDevices.addAll(Provider.of<SmartDevicesProvider>(context)
        .smartRefrigerators
        .where((s) => s.roomIndex == index));
    roomDevices.addAll(Provider.of<SmartDevicesProvider>(context)
        .smartSpeakers
        .where((s) => s.roomIndex == index));
    roomDevices.addAll(Provider.of<SmartDevicesProvider>(context)
        .smartTvs
        .where((s) => s.roomIndex == index));
    roomDevices.addAll(Provider.of<SmartDevicesProvider>(context)
        .smartWashers
        .where((s) => s.roomIndex == index));
  }

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    final devicesProvider = Provider.of<SmartDevicesProvider>(context);
    final roomsProvider = Provider.of<RoomsProvider>(context);
    final index = roomsProvider.currentRoomIndex!;

    setRoomDevices(context, index);
    return Scaffold(
      appBar: AppBar(
        title: Reusabletext(
          Constants.roomsNames[index],
          FontWeight.bold,
          Constants.primaryColor,
          22,
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (isEditing) {
                  for (var d in roomsProvider.smartDevices) {
                    if (d is SmartLamp) {
                      devicesProvider.removeSmartLamp(d);
                    } else if (d is SmartTv) {
                      devicesProvider.removeSmartTv(d);
                    } else if (d is SmartPlug) {
                      devicesProvider.removeSmartPlug(d);
                    } else if (d is SmartThermostat) {
                      devicesProvider.removeSmartThermostat(d);
                    } else if (d is SmartRefrigerator) {
                      devicesProvider.removeSmartRefrigerator(d);
                    } else if (d is SmartSpeaker) {
                      devicesProvider.removeSmartSpeaker(d);
                    } else if (d is SmartClock) {
                      devicesProvider.removeSmartClock(d);
                    } else if (d is SmartMicrowave) {
                      devicesProvider.removeSmartMicrowave(d);
                    } else if (d is SmartWasher) {
                      devicesProvider.removeSmartWasher(d);
                    } else if (d is SmartGarage) {
                      devicesProvider.removeSmartGarage(d);
                    }
                  }
                  roomsProvider.clearSmartDevices();
                }
                setState(() {
                  isEditing = !isEditing;
                });
              },
              icon: Icon(!isEditing ? Icons.edit : Icons.delete))
        ],
      ),
      body: roomDevices.isEmpty
          ? Center(
              child: AddDeviceBtn(),
            )
          : GridView.builder(
              itemCount: roomDevices.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (ctx, index) {
                return index < roomDevices.length
                    ? GridDeivceCard(roomDevices[index], isEditing)
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AddDeviceBtn(),
                      );
              }),
    );
  }
}
