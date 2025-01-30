import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Models/SmartGarage.dart';
import 'package:home_assistant/Utils/Constants.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/RoomsProvider.dart';

class GarageBottomSheetWidget extends StatefulWidget {
  const GarageBottomSheetWidget({super.key});

  @override
  State<GarageBottomSheetWidget> createState() =>
      _GarageBottomSheetWidgetState();
}

class _GarageBottomSheetWidgetState extends State<GarageBottomSheetWidget> {
  late SmartGarage garage;
  @override
  void initState() {
    garage = Provider.of<RoomsProvider>(context, listen: false).smartDevice
        as SmartGarage;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<RoomsProvider>(context, listen: false).setSmartDevice(garage);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  garage.isDown = false;
                  garage.isUp = true;
                });
              },
              child: Image.asset(
                "Assets/Icons/up.png",
                scale: 5,
                color: garage.isUp ? Constants.secondaryColor : Colors.green,
              ),
            ),
            const SizedBox(height: 82),
            InkWell(
              onTap: () {
                setState(() {
                  garage.isDown = true;
                  garage.isUp = false;
                });
              },
              child: Image.asset(
                "Assets/Icons/down.png",
                color: garage.isDown ? Constants.secondaryColor : Colors.green,
                scale: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
