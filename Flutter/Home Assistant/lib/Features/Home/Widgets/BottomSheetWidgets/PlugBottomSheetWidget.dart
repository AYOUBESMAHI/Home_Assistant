import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Models/SmartPlug.dart';
import 'package:home_assistant/Providers/RoomsProvider.dart';
import 'package:provider/provider.dart';

import '../../../../Utils/Constants.dart';
import '../../../../Widgets/ReusableText.dart';

class PlugBottomSheetWidget extends StatefulWidget {
  const PlugBottomSheetWidget({super.key});

  @override
  State<PlugBottomSheetWidget> createState() => _PlugBottomSheetWidgetState();
}

class _PlugBottomSheetWidgetState extends State<PlugBottomSheetWidget> {
  late SmartPlug plug;
  @override
  void initState() {
    plug = Provider.of<RoomsProvider>(context, listen: false).smartDevice
        as SmartPlug;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<RoomsProvider>(context, listen: false).setSmartDevice(plug);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Reusabletext(
              "Usage ${plug.usageKw.toString()}",
              FontWeight.bold,
              Constants.secondaryColor,
              33,
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(32))),
              child: InkWell(
                onTap: () {
                  setState(() {
                    plug.isOn = !plug.isOn;
                  });
                },
                child: Image.asset(
                  "Assets/Images/power-on.png",
                  scale: 4,
                  color: plug.isOn ? Colors.green : Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
