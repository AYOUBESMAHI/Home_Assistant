import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_assistant/Providers/RoomsProvider.dart';
import 'package:home_assistant/Utils/Constants.dart';
import 'package:provider/provider.dart';

import '../../Models/SmartLamp.dart';

class LampBottomSheetWidget extends StatefulWidget {
  const LampBottomSheetWidget({super.key});

  @override
  State<LampBottomSheetWidget> createState() => _LampBottomSheetWidgetState();
}

class _LampBottomSheetWidgetState extends State<LampBottomSheetWidget> {
  late SmartLamp lamp;
  @override
  void initState() {
    lamp = Provider.of<RoomsProvider>(context, listen: false).smartDevice
        as SmartLamp;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<RoomsProvider>(context, listen: false).setSmartDevice(lamp);
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
                  lamp.isOn = !lamp.isOn;
                });
              },
              child: Image.asset(
                "Assets/Images/power-on.png",
                scale: 8,
                color: lamp.isOn ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 12),
            if (lamp.isOn)
              Center(
                child: Image.asset(
                  "Assets/Icons/bulb.png",
                  scale: 2.5,
                  color: HexColor(lamp.color),
                ),
              ),
            const SizedBox(height: 28),
            if (lamp.isOn)
              Center(
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return colorPickerDialog();
                        }).then((c) => setState(() {}));
                  },
                  child: Image.asset(
                    "Assets/Icons/color-wheel.png",
                    scale: 8,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Dialog colorPickerDialog() {
    return Dialog(
      backgroundColor: Constants.accentColor,
      child: Container(
        height: 400,
        padding: const EdgeInsets.all(22),
        child: GridView.builder(
          itemCount: Constants.smartLampColors.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 5,
            crossAxisSpacing: 1,
            childAspectRatio: 1.4,
            crossAxisCount: 3,
          ),
          itemBuilder: (ctx, index) => InkWell(
            onTap: () {
              lamp.color = Constants.smartLampColors[index];
              Navigator.of(ctx).pop();
            },
            child: CircleAvatar(
                backgroundColor: HexColor(Constants.smartLampColors[index])),
          ),
        ),
      ),
    );
  }
}
