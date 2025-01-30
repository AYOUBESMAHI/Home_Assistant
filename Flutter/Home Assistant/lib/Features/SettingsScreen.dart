import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/Constants.dart';
import '../Widgets/ReusableText.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Reusabletext(
                "Settings",
                FontWeight.w900,
                Constants.primaryColor,
                32,
              ),
              const SizedBox(height: 12),
              settingsCard([
                rowTextIcon("Personal Informations"),
                SizedBox(height: 4),
                rowTextIcon("Account and Security"),
                SizedBox(height: 4),
                rowTextIcon("Device Update"),
              ]),
              SizedBox(height: 8),
              settingsCard([
                rowTextWidget(
                    "Touch Tone on Panel",
                    CupertinoSwitch(
                        activeTrackColor: Constants.primaryColor,
                        inactiveTrackColor:
                            const Color.fromARGB(255, 167, 163, 163),
                        value: isActive,
                        onChanged: (v) => setState(() {
                              isActive = v;
                            }))),
                SizedBox(height: 4),
                rowTextIcon("App Notification"),
                SizedBox(height: 4),
                rowTextWidget(
                    "Dark Mode",
                    Row(children: [
                      Reusabletext(
                          "off", FontWeight.bold, Constants.primaryColor, 15),
                      Icon(Icons.navigate_next,
                          color: Constants.primaryColor, size: 33)
                    ])),
                rowTextWidget(
                    "Temperature Unit",
                    Row(children: [
                      Reusabletext(
                          "°C", FontWeight.bold, Constants.primaryColor, 15),
                      Icon(Icons.navigate_next,
                          color: Constants.primaryColor, size: 33)
                    ])),
                rowTextIcon("Language"),
                rowTextIcon("More Features"),
              ]),
              SizedBox(height: 8),
              settingsCard([
                rowTextIcon("Settings of Home Assistant"),
              ]),
              SizedBox(height: 8),
              settingsCard([
                rowTextIcon("About"),
                rowTextIcon("Privacy Settings"),
                rowTextIcon("Privacy Policy Managment"),
              ])
            ],
          ),
        ),
      ),
    );
  }

  Widget settingsCard(children) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Constants.accentColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget rowTextIcon(text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Reusabletext(
          text,
          FontWeight.bold,
          Constants.primaryColor,
          15,
        ),
        Icon(
          Icons.navigate_next,
          color: Constants.primaryColor,
          size: 33,
        )
      ],
    );
  }

  Widget rowTextWidget(text, widget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Reusabletext(
          text,
          FontWeight.bold,
          Constants.primaryColor,
          15,
        ),
        widget
      ],
    );
  }
}
