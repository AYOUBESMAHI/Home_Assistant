import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_assistant/Features/Home/Models/SmartMicrowave.dart';
import 'package:home_assistant/Providers/RoomsProvider.dart';
import 'package:provider/provider.dart';

import '../../../../Utils/Constants.dart';
import '../../../../Widgets/ReusableText.dart';

class MicrowaveBottomSheetWidget extends StatefulWidget {
  const MicrowaveBottomSheetWidget({super.key});

  @override
  State<MicrowaveBottomSheetWidget> createState() =>
      _MicrowaveBottomSheetWidgetState();
}

class _MicrowaveBottomSheetWidgetState
    extends State<MicrowaveBottomSheetWidget> {
  late SmartMicrowave microwave;
  @override
  void initState() {
    microwave = Provider.of<RoomsProvider>(context, listen: false).smartDevice
        as SmartMicrowave;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<RoomsProvider>(context, listen: false)
        .setSmartDevice(microwave);
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
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      microwave.isOn = !microwave.isOn;
                    });
                  },
                  child: Image.asset(
                    "Assets/Images/power-on.png",
                    scale: 8,
                    color: microwave.isOn ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 16),
            if (microwave.isOn)
              Reusabletext("Cooking Temperature : ${microwave.temp}°C",
                  FontWeight.bold, HexColor("2F4F4F"), 22),
            if (microwave.isOn)
              Reusabletext("Cooking Time : ${microwave.time}min",
                  FontWeight.bold, HexColor("000080"), 22),
            const SizedBox(height: 22),
            if (microwave.isOn)
              Expanded(
                  child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                              microwave.cookingMode = CookingMode.chicken;
                              microwave.temp = 180;
                              microwave.time = 20;
                            });
                          case 1:
                            setState(() {
                              microwave.cookingMode = CookingMode.steak;
                              microwave.temp = 200;
                              microwave.time = 10;
                            });
                          case 2:
                            setState(() {
                              microwave.cookingMode = CookingMode.legs;
                              microwave.temp = 190;
                              microwave.time = 25;
                            });
                          case 3:
                            setState(() {
                              microwave.cookingMode = CookingMode.shrimp;
                              microwave.temp = 190;
                              microwave.time = 8;
                            });
                          case 4:
                            setState(() {
                              microwave.cookingMode = CookingMode.fries;
                              microwave.temp = 200;
                              microwave.time = 15;
                            });
                          case 5:
                            setState(() {
                              microwave.cookingMode = CookingMode.vegetables;
                              microwave.temp = 180;
                              microwave.time = 10;
                            });
                          case 6:
                            setState(() {
                              microwave.cookingMode = CookingMode.fish;
                              microwave.temp = 180;
                              microwave.time = 12;
                            });
                          case 7:
                            setState(() {
                              microwave.cookingMode = CookingMode.pie;
                              microwave.temp = 180;
                              microwave.time = 25;
                            });
                          case 8:
                            setState(() {
                              microwave.cookingMode = CookingMode.custom;
                            });
                            showDialog(
                                context: context,
                                builder: (ctx) => customModeDialog()).then((v) {
                              setState(() {});
                            });
                        }
                      });
                    },
                    child: Container(
                      color: index == microwave.cookingMode.index
                          ? const Color.fromARGB(255, 192, 192, 192)
                          : null,
                      child: Image.asset(
                        Constants.cookingModesIcons[index],
                      ),
                    )),
              )),
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
          height: 200,
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
                        if (microwave.temp > 100) {
                          microwave.temp -= 5;
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
                      microwave.temp.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    )),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (microwave.temp < 200) {
                          microwave.temp += 5;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Reusabletext(
                    "Time : ",
                    FontWeight.bold,
                    Constants.primaryColor,
                    20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (microwave.time > 1) {
                          microwave.time--;
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
                      microwave.time.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    )),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (microwave.time < 30) {
                          microwave.time++;
                        }
                      });
                    },
                    child: Image.asset(
                      "Assets/Images/plus.png",
                      scale: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
