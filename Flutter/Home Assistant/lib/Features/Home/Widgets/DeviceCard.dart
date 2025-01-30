import 'package:flutter/material.dart';
import '../../../Utils/Constants.dart';

class DeviceCard extends StatelessWidget {
  final Map<String, dynamic> device;
  const DeviceCard(this.device, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox.fromSize(
              size: const Size.fromRadius(33),
              child: Image.asset(device["image"])),
          const SizedBox(width: 4),
          Text(device["name"],
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Constants.secondaryColor,
                fontSize: 12,
              ))
        ],
      ),
    );
  }
}
