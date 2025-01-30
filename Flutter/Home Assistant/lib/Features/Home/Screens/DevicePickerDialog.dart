import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Screens/DeviceConnectionScreen.dart';
import 'package:home_assistant/Features/Home/Widgets/DeviceCard.dart';
import 'package:home_assistant/Providers/RoomsProvider.dart';
import 'package:home_assistant/Utils/Constants.dart';
import 'package:home_assistant/Widgets/ReusableText.dart';
import 'package:provider/provider.dart';

class DevicePickerDialog extends StatelessWidget {
  const DevicePickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final index =
        Provider.of<RoomsProvider>(context, listen: false).currentRoomIndex!;
    var devices = [];
    devices = allDevices.where((d) => d["rooms"].contains(index)).toList();
    return Dialog(
      backgroundColor: Constants.accentColor,
      child: Container(
        padding: const EdgeInsets.all(6),
        height: 450,
        child: Column(
          children: [
            Reusabletext(
              "Choose the device you're setting up.",
              FontWeight.bold,
              Constants.primaryColor,
              18,
            ),
            const SizedBox(height: 6),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) => InkWell(
                    onTap: () {
                      Provider.of<RoomsProvider>(context, listen: false)
                          .setSelectedDevice(devices[index]);

                      Navigator.of(context)
                          .push(MaterialPageRoute(
                            builder: (ctx) => DeviceConnectionScreen(),
                          ))
                          .then((v) => Navigator.pop(context));
                    },
                    child: DeviceCard(devices[index])),
                itemCount: devices.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
