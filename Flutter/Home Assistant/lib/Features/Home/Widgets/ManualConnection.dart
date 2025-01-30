import 'package:flutter/material.dart';
import 'package:home_assistant/Providers/RoomsProvider.dart';
import 'package:home_assistant/Providers/SmartDevicesProvider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Constants.dart';
import '../../../Widgets/ReusableText.dart';

class ManualConnection extends StatefulWidget {
  const ManualConnection({super.key});

  @override
  State<ManualConnection> createState() => _ManualConnectionState();
}

class _ManualConnectionState extends State<ManualConnection> {
  final TextEditingController _controller = TextEditingController();
  var password = "";
  bool isSearching = false;
  late Map<String, dynamic> device;
  late int index;
  String? alertMessage;
  @override
  Widget build(BuildContext context) {
    index =
        Provider.of<RoomsProvider>(context, listen: false).currentRoomIndex!;
    device = Provider.of<RoomsProvider>(context, listen: false).selectedDevice!;

    return SingleChildScrollView(
      child: Column(children: [
        const SizedBox(height: 8),
        Reusabletext("Enter the number of your device", FontWeight.bold,
            Constants.primaryColor, 19),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Pinput(
            length: 8,
            keyboardType: TextInputType.emailAddress,
            onChanged: (pin) async {
              setState(() {
                password = pin;
              });
            },
            controller: _controller,
          ),
        ),
        ElevatedButton(
          onPressed: password.length == 8
              ? () async {
                  if (!isSearching) {
                    setState(() {
                      isSearching = true;
                    });
                    switch (device["name"]) {
                      case "Smart Clock":
                        alertMessage = await Provider.of<SmartDevicesProvider>(
                                context,
                                listen: false)
                            .getSmartClock(password, index);
                        break;
                      case "Smart Garage":
                        alertMessage = await Provider.of<SmartDevicesProvider>(
                                context,
                                listen: false)
                            .getSmarGarage(password, index);
                        break;
                      case "LED Smart Bulb":
                        alertMessage = await Provider.of<SmartDevicesProvider>(
                                context,
                                listen: false)
                            .getSmartLamp(password, index);
                        break;
                      case "Smart Refrigerator":
                        alertMessage = await Provider.of<SmartDevicesProvider>(
                                context,
                                listen: false)
                            .getSmartRefrigerator(password, index);
                        break;
                      case "Smart Microwave":
                        alertMessage = await Provider.of<SmartDevicesProvider>(
                                context,
                                listen: false)
                            .getSmartMicrowave(password, index);
                      case "Smart Plug":
                        alertMessage = await Provider.of<SmartDevicesProvider>(
                                context,
                                listen: false)
                            .getSmartPlug(password, index);
                        break;
                      case "Smart Speaker":
                        alertMessage = await Provider.of<SmartDevicesProvider>(
                                context,
                                listen: false)
                            .getSmartSpeaker(password, index);
                        break;
                      case "Smart Thermostat":
                        alertMessage = await Provider.of<SmartDevicesProvider>(
                                context,
                                listen: false)
                            .getSmartThermostat(password, index);
                        break;
                      case "Smart Tv":
                        alertMessage = await Provider.of<SmartDevicesProvider>(
                                context,
                                listen: false)
                            .getSmartTv(password, index);
                        break;
                      case "Smart Washing Machine":
                        alertMessage = await Provider.of<SmartDevicesProvider>(
                                context,
                                listen: false)
                            .getSmartWasher(password, index);
                        break;
                    }
                    if (alertMessage != null) {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          backgroundColor: Constants.accentColor,
                          title: Reusabletext("Alert", FontWeight.bold,
                              Constants.secondaryColor, 18),
                          content: Reusabletext(alertMessage!, FontWeight.w300,
                              Constants.primaryColor, 14),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isSearching = false;
                                    Navigator.pop(context);
                                  });
                                },
                                child: Text("Ok")),
                          ],
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  }
                }
              : null,
          child: isSearching
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: Constants.accentColor,
                  ),
                )
              : const Text("Confirm"),
        ),
        Image.asset("Assets/Images/House searching-bro.png")
      ]),
    );
  }
}
