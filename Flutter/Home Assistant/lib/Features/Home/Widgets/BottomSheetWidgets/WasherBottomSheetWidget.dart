import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_assistant/Features/Home/Models/SmartWasher.dart';
import 'package:home_assistant/Providers/RoomsProvider.dart';
import 'package:home_assistant/Utils/Constants.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/ReusableText.dart';

class WasherBottomSheetWidget extends StatefulWidget {
  const WasherBottomSheetWidget({super.key});

  @override
  State<WasherBottomSheetWidget> createState() =>
      _WasherBottomSheetWidgetState();
}

class _WasherBottomSheetWidgetState extends State<WasherBottomSheetWidget> {
  late SmartWasher washer;
  @override
  void initState() {
    washer = Provider.of<RoomsProvider>(context, listen: false).smartDevice
        as SmartWasher;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<RoomsProvider>(context, listen: false).setSmartDevice(washer);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      washer.isOn = !washer.isOn;
                    });
                  },
                  child: Image.asset(
                    "Assets/Images/power-on.png",
                    scale: 8,
                    color: washer.isOn ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(width: 18),
                if (washer.isOn)
                  Reusabletext(
                    Constants
                        .washModesColors[washer.washingMode.index].keys.first,
                    FontWeight.bold,
                    Constants.accentColor,
                    22,
                  )
              ],
            ),
            const SizedBox(height: 16),
            if (washer.isOn)
              Reusabletext("Temperature : ${washer.temperature}°C",
                  FontWeight.bold, HexColor("2F4F4F"), 22),
            if (washer.isOn)
              Reusabletext(
                  "Spin Speed : ${washer.speedLevel.name == "veryhight" ? "VERY HIGHT" : washer.speedLevel.name.toUpperCase()}",
                  FontWeight.bold,
                  HexColor("2F4F4F"),
                  22),
            if (washer.isOn)
              Reusabletext(
                  "Soil Level : ${washer.soilLevel.name == "na" ? "N/A" : washer.soilLevel.name.toUpperCase()}",
                  FontWeight.bold,
                  HexColor("2F4F4F"),
                  22),
            const SizedBox(height: 22),
            if (washer.isOn)
              Expanded(
                child: GridView.builder(
                    itemCount: WashingModes.values.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 4,
                            childAspectRatio: 2.5),
                    itemBuilder: (ctx, index) => InkWell(
                          onTap: () {
                            setState(() {
                              switch (index) {
                                case 0:
                                  setState(() {
                                    washer.washingMode = WashingModes.standard;
                                    washer.temperature = 40;
                                    washer.speedLevel = SpeedLevel.medium;
                                    washer.soilLevel = SoilLevel.normal;
                                  });
                                case 1:
                                  setState(() {
                                    washer.washingMode = WashingModes.delicate;
                                    washer.temperature = 30;
                                    washer.speedLevel = SpeedLevel.low;
                                    washer.soilLevel = SoilLevel.light;
                                  });
                                case 2:
                                  setState(() {
                                    washer.washingMode = WashingModes.quick;
                                    washer.temperature = 30;
                                    washer.speedLevel = SpeedLevel.hight;
                                    washer.soilLevel = SoilLevel.light;
                                  });
                                case 3:
                                  setState(() {
                                    washer.washingMode = WashingModes.heavyDuty;
                                    washer.temperature = 60;
                                    washer.speedLevel = SpeedLevel.hight;
                                    washer.soilLevel = SoilLevel.heavy;
                                  });
                                case 4:
                                  setState(() {
                                    washer.washingMode = WashingModes.eco;
                                    washer.temperature = 30;
                                    washer.speedLevel = SpeedLevel.medium;
                                    washer.soilLevel = SoilLevel.normal;
                                  });
                                case 5:
                                  setState(() {
                                    washer.washingMode = WashingModes.spin;
                                    washer.temperature = 0;
                                    washer.speedLevel = SpeedLevel.veryhight;
                                    washer.soilLevel = SoilLevel.na;
                                  });
                                case 6:
                                  setState(() {
                                    washer.washingMode = WashingModes.rinse;
                                    washer.temperature = 20;
                                    washer.speedLevel = SpeedLevel.medium;
                                    washer.soilLevel = SoilLevel.na;
                                  });
                                case 7:
                                  setState(() {
                                    washer.washingMode = WashingModes.steam;
                                    washer.temperature = 60;
                                    washer.speedLevel = SpeedLevel.low;
                                    washer.soilLevel = SoilLevel.na;
                                  });
                                case 8:
                                  setState(() {
                                    washer.washingMode = WashingModes.wool;
                                    washer.temperature = 30;
                                    washer.speedLevel = SpeedLevel.low;
                                    washer.soilLevel = SoilLevel.light;
                                  });
                                case 9:
                                  showDialog(
                                          context: context,
                                          builder: (ctx) => customModeDialog())
                                      .then((v) {
                                    setState(() {
                                      washer.washingMode = WashingModes.custom;
                                    });
                                  });
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: index == washer.washingMode.index
                                    ? Constants.accentColor
                                    : Constants
                                        .washModesColors[index].values.first),
                            padding: const EdgeInsets.all(2),
                            child: Center(
                              child: Reusabletext(
                                  Constants.washModesColors[index].keys.first,
                                  FontWeight.bold,
                                  Colors.white,
                                  22),
                            ),
                          ),
                        )),
              )
          ],
        ),
      ),
    );
  }

  Dialog customModeDialog() {
    return Dialog(
      backgroundColor: Constants.accentColor,
      child: StatefulBuilder(
        builder: (ctx, setState) => Container(
          height: 300,
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Reusabletext(
                    "Temperature : ",
                    FontWeight.bold,
                    Constants.primaryColor,
                    20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (washer.temperature > 20) {
                          washer.temperature--;
                        }
                      });
                    },
                    child: Image.asset(
                      "Assets/Images/remove.png",
                      scale: 14,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Center(
                        child: Text(
                      washer.temperature.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    )),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (washer.temperature < 90) {
                          washer.temperature++;
                        }
                      });
                    },
                    child: Image.asset(
                      "Assets/Images/plus.png",
                      scale: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Reusabletext(
                "Speed Level : ",
                FontWeight.bold,
                Constants.primaryColor,
                20,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          washer.speedLevel = SpeedLevel.low;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: washer.speedLevel == SpeedLevel.low
                                ? Colors.grey
                                : Colors.white),
                        child: const Center(
                            child: Text(
                          "Low",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )),
                      )),
                  const SizedBox(width: 8),
                  InkWell(
                      onTap: () {
                        setState(() {
                          washer.speedLevel = SpeedLevel.medium;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: washer.speedLevel == SpeedLevel.medium
                                ? Colors.grey
                                : Colors.white),
                        child: const Center(
                            child: Text(
                          "Medium",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )),
                      )),
                  const SizedBox(width: 8),
                  InkWell(
                      onTap: () {
                        setState(() {
                          washer.speedLevel = SpeedLevel.hight;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: washer.speedLevel == SpeedLevel.hight
                                ? Colors.grey
                                : Colors.white),
                        child: const Center(
                            child: Text(
                          "Hight",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )),
                      )),
                  const SizedBox(width: 8),
                  InkWell(
                      onTap: () {
                        setState(() {
                          washer.speedLevel = SpeedLevel.veryhight;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: washer.speedLevel == SpeedLevel.veryhight
                                ? Colors.grey
                                : Colors.white),
                        child: const Center(
                            child: Text(
                          "Very Hight",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )),
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Reusabletext(
                "Soil Level : ",
                FontWeight.bold,
                Constants.primaryColor,
                20,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          washer.soilLevel = SoilLevel.na;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: washer.soilLevel == SoilLevel.na
                                ? Colors.grey
                                : Colors.white),
                        child: const Center(
                            child: Text(
                          "N/A",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )),
                      )),
                  const SizedBox(width: 8),
                  InkWell(
                      onTap: () {
                        setState(() {
                          washer.soilLevel = SoilLevel.light;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: washer.soilLevel == SoilLevel.light
                                ? Colors.grey
                                : Colors.white),
                        child: const Center(
                            child: Text(
                          "Light",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )),
                      )),
                  const SizedBox(width: 8),
                  InkWell(
                      onTap: () {
                        setState(() {
                          washer.soilLevel = SoilLevel.normal;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: washer.soilLevel == SoilLevel.normal
                                ? Colors.grey
                                : Colors.white),
                        child: const Center(
                            child: Text(
                          "Normal",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )),
                      )),
                  const SizedBox(width: 8),
                  InkWell(
                      onTap: () {
                        setState(() {
                          washer.soilLevel = SoilLevel.heavy;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: washer.soilLevel == SoilLevel.heavy
                                ? Colors.grey
                                : Colors.white),
                        child: const Center(
                            child: Text(
                          "Heavy",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
