import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils/Constants.dart';
import '../../../Widgets/ReusableText.dart';
import '../Screens/DevicePickerDialog.dart';

class AddDeviceBtn extends StatefulWidget {
  const AddDeviceBtn({super.key});

  @override
  State<AddDeviceBtn> createState() => _AddDeviceBtnState();
}

class _AddDeviceBtnState extends State<AddDeviceBtn> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        showDialog(
            context: context,
            builder: (ctx) {
              return DevicePickerDialog();
            }).then((ctx) {
          setState(() {});
        });
      },
      label: Reusabletext(
        "Add Device",
        FontWeight.bold,
        Constants.primaryColor,
        22,
      ),
      icon: Icon(
        CupertinoIcons.add,
        color: Constants.accentColor,
      ),
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Constants.primaryColor),
        )),
      ),
    );
  }
}
