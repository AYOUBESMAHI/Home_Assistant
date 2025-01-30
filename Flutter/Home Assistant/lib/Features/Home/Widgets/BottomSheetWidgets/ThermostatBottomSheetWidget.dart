import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Models/SmartThermostat.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/RoomsProvider.dart';
import '../../../../Widgets/ReusableText.dart';

class ThermostatBottomSheetWidget extends StatefulWidget {
  const ThermostatBottomSheetWidget({
    super.key,
  });

  @override
  State<ThermostatBottomSheetWidget> createState() =>
      _ThermostatBottomSheetWidgetState();
}

class _ThermostatBottomSheetWidgetState
    extends State<ThermostatBottomSheetWidget> {
  late SmartThermostat thermostat;

  @override
  void initState() {
    thermostat = Provider.of<RoomsProvider>(context, listen: false).smartDevice
        as SmartThermostat;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<RoomsProvider>(context, listen: false)
        .setSmartDevice(thermostat);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  thermostat.isOn = !thermostat.isOn;
                });
              },
              child: Image.asset(
                "Assets/Images/power-on.png",
                scale: 8,
                color: thermostat.isOn ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 22),
            if (thermostat.isOn)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (thermostat.temperature > 10) {
                        setState(() => thermostat.temperature--);
                      }
                    },
                    child: Image.asset(
                      "Assets/Images/remove.png",
                      scale: 12,
                      color: Colors.red,
                    ),
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        "Assets/Images/Thermostat.png",
                        scale: 2,
                      ),
                      Positioned(
                        bottom: 105,
                        left: 105,
                        child: Reusabletext(
                          "${thermostat.temperature}°",
                          FontWeight.bold,
                          (thermostat.temperature >= 10 &&
                                  thermostat.temperature < 20)
                              ? Colors.green
                              : (thermostat.temperature > 24 &&
                                      thermostat.temperature <= 32)
                                  ? Colors.red
                                  : Colors.amber,
                          33,
                        ),
                      )
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        if (thermostat.temperature < 32) {
                          setState(() => thermostat.temperature++);
                        }
                      },
                      child: Image.asset(
                        "Assets/Images/plus.png",
                        scale: 12,
                      )),
                ],
              )
          ],
        ),
      ),
    );
  }
}
