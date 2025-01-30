import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Models/SmartClock.dart';
import 'package:home_assistant/Features/Home/Models/SmartDevice.dart';
import 'package:home_assistant/Features/Home/Models/SmartGarage.dart';
import 'package:home_assistant/Features/Home/Models/SmartLamp.dart';
import 'package:home_assistant/Features/Home/Models/SmartMicrowave.dart';
import 'package:home_assistant/Features/Home/Models/SmartPlug.dart';
import 'package:home_assistant/Features/Home/Models/SmartRefrigerator.dart';
import 'package:home_assistant/Features/Home/Models/SmartSpeaker.dart';
import 'package:home_assistant/Features/Home/Models/SmartThermostat.dart';
import 'package:home_assistant/Features/Home/Models/SmartTv.dart';
import 'package:home_assistant/Features/Home/Models/SmartWasher.dart';
import 'package:home_assistant/Features/Home/Widgets/BottomSheetWidgets/ClockBottomSheetWidget.dart';
import 'package:home_assistant/Features/Home/Widgets/BottomSheetWidgets/GarageBottomSheetWidget.dart';
import 'package:home_assistant/Features/Home/Widgets/BottomSheetWidgets/MicrowaveBottomSheetWidget.dart';
import 'package:home_assistant/Features/Home/Widgets/BottomSheetWidgets/RefrigeratorBottomSheetWidget.dart';
import 'package:home_assistant/Features/Home/Widgets/BottomSheetWidgets/WasherBottomSheetWidget.dart';
import 'package:home_assistant/Providers/SmartDevicesProvider.dart';
import 'package:provider/provider.dart';

import '../../../Providers/RoomsProvider.dart';
import '../../../Utils/Constants.dart';
import '../../../Widgets/ReusableText.dart';
import 'BottomSheetWidgets/SpeackerBottomSheetWidget.dart';
import 'BottomSheetWidgets/LampBottomSheetWidget.dart';
import 'BottomSheetWidgets/PlugBottomSheetWidget.dart';
import 'BottomSheetWidgets/ThermostatBottomSheetWidget.dart';
import 'BottomSheetWidgets/TvBottomSheetWidget.dart';

class GridDeivceCard extends StatefulWidget {
  final SmartDevice device;
  final bool isEditing;
  const GridDeivceCard(this.device, this.isEditing, {super.key});

  @override
  State<GridDeivceCard> createState() => _GridDeivceCardState();
}

class _GridDeivceCardState extends State<GridDeivceCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final devicesProvider = Provider.of<SmartDevicesProvider>(context);
    final roomsProvider = Provider.of<RoomsProvider>(context);
    if (!widget.isEditing) {
      isSelected = false;
    }
    return GestureDetector(
      onTap: () {
        if (!widget.isEditing) {
          Provider.of<RoomsProvider>(context, listen: false)
              .setSmartDevice(widget.device);

          showModalBottomSheet(
              backgroundColor: Constants.primaryColor,
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(32))),
              builder: (ctx) {
                if (widget.device is SmartLamp) {
                  return LampBottomSheetWidget();
                } else if (widget.device is SmartTv) {
                  return TvBottomSheetWidget();
                } else if (widget.device is SmartPlug) {
                  return PlugBottomSheetWidget();
                } else if (widget.device is SmartThermostat) {
                  return ThermostatBottomSheetWidget();
                } else if (widget.device is SmartRefrigerator) {
                  return RefrigeratorBottomSheetWidget();
                } else if (widget.device is SmartSpeaker) {
                  return SpeackerBottomSheetWidget();
                } else if (widget.device is SmartClock) {
                  return ClockBottomSheetWidget();
                } else if (widget.device is SmartMicrowave) {
                  return MicrowaveBottomSheetWidget();
                } else if (widget.device is SmartWasher) {
                  return WasherBottomSheetWidget();
                } else {
                  return GarageBottomSheetWidget();
                }
              }).then((v) async {
            await updateDevices(devicesProvider);
          });
        } else {
          setState(() {
            isSelected = !isSelected;
          });
          if (isSelected) {
            roomsProvider.setSmartDevices(widget.device);
          } else {
            roomsProvider.removeSmartDevice(widget.device);
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: (!widget.isEditing)
                        ? null
                        : !isSelected
                            ? Colors.grey
                            : Colors.red,
                    image: DecorationImage(
                      //fit: BoxFit.cover,
                      image: AssetImage(widget.device.image),
                    ),
                    boxShadow: const []),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.device.name,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Constants.primaryColor,
                fontSize: 18,
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  Future<void> updateDevices(SmartDevicesProvider provider) async {
    String? alertMessage;
    if (widget.device is SmartClock) {
      alertMessage =
          await provider.updateSmartClock(widget.device as SmartClock);
    }
    if (widget.device is SmartGarage) {
      alertMessage =
          await provider.updateSmartGarage(widget.device as SmartGarage);
    }
    if (widget.device is SmartLamp) {
      alertMessage = await provider.updateSmartLamp(widget.device as SmartLamp);
    }
    if (widget.device is SmartMicrowave) {
      alertMessage =
          await provider.updateSmartMicrowave(widget.device as SmartMicrowave);
    }
    if (widget.device is SmartPlug) {
      alertMessage = await provider.updateSmartPlug(widget.device as SmartPlug);
    }
    if (widget.device is SmartRefrigerator) {
      alertMessage = await provider
          .updateSmartRefrigerator(widget.device as SmartRefrigerator);
    }
    if (widget.device is SmartSpeaker) {
      alertMessage =
          await provider.updateSmartSpeaker(widget.device as SmartSpeaker);
    }
    if (widget.device is SmartThermostat) {
      alertMessage = await provider
          .updateSmartThermostat(widget.device as SmartThermostat);
    }
    if (widget.device is SmartTv) {
      alertMessage = await provider.updateSmartTv(widget.device as SmartTv);
    }
    if (widget.device is SmartWasher) {
      alertMessage =
          await provider.updateSmartWasher(widget.device as SmartWasher);
    }
    if (alertMessage != null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: Constants.accentColor,
          title: Reusabletext(
              "Alert", FontWeight.bold, Constants.secondaryColor, 18),
          content: Reusabletext(
              alertMessage!, FontWeight.w300, Constants.primaryColor, 14),
          actions: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: Text("Ok")),
          ],
        ),
      );
    }
  }
}
