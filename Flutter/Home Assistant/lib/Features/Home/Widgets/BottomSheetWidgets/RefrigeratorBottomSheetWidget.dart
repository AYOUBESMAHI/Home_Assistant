import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_assistant/Features/Home/Models/SmartRefrigerator.dart';
import 'package:home_assistant/Providers/RoomsProvider.dart';
import 'package:home_assistant/Utils/Constants.dart';
import 'package:home_assistant/Widgets/ReusableText.dart';
import 'package:provider/provider.dart';

class RefrigeratorBottomSheetWidget extends StatefulWidget {
  const RefrigeratorBottomSheetWidget({super.key});

  @override
  State<RefrigeratorBottomSheetWidget> createState() =>
      _RefrigeratorBottomSheetWidgetState();
}

class _RefrigeratorBottomSheetWidgetState
    extends State<RefrigeratorBottomSheetWidget> {
  late SmartRefrigerator refrigerator;

  @override
  void initState() {
    refrigerator = Provider.of<RoomsProvider>(context, listen: false)
        .smartDevice as SmartRefrigerator;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<RoomsProvider>(context, listen: false)
        .setSmartDevice(refrigerator);
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
                      refrigerator.isOn = !refrigerator.isOn;
                    });
                  },
                  child: Image.asset(
                    "Assets/Images/power-on.png",
                    scale: 8,
                    color: refrigerator.isOn ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(width: 8),
                if (refrigerator.isOn)
                  Reusabletext(
                    !refrigerator.isDoorOpen
                        ? "The door is open"
                        : "The door is close",
                    FontWeight.bold,
                    Constants.secondaryColor,
                    22,
                  )
              ],
            ),
            const SizedBox(height: 16),
            if (refrigerator.isOn)
              Reusabletext("Fridge Temperature : ${refrigerator.firdgeTemp}°C",
                  FontWeight.bold, HexColor("2F4F4F"), 22),
            if (refrigerator.isOn)
              Reusabletext("Freeze Temperature : ${refrigerator.freezerTemp}°C",
                  FontWeight.bold, HexColor("000080"), 22),
            const SizedBox(height: 22),
            if (refrigerator.isOn)
              Expanded(
                child: GridView.builder(
                    itemCount: 4,
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
                                  refrigerator.firdgeTemp = 5;
                                  refrigerator.freezerTemp = -12;
                                  refrigerator.coolingMode =
                                      CoolingModes.normal;
                                case 1:
                                  refrigerator.firdgeTemp = 3;
                                  refrigerator.freezerTemp = -20;
                                  refrigerator.coolingMode =
                                      CoolingModes.superCool;
                                case 2:
                                  refrigerator.firdgeTemp = 1;
                                  refrigerator.freezerTemp = -24;
                                  refrigerator.coolingMode =
                                      CoolingModes.superFreeze;
                                case 3:
                                  refrigerator.coolingMode =
                                      CoolingModes.custom;
                                  showDialog(
                                          context: context,
                                          builder: (ctx) => customModeDialog())
                                      .then((v) {
                                    setState(() {});
                                  });
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                )
                              ],
                              color: (index == CoolingModes.normal.index) &&
                                      refrigerator.coolingMode ==
                                          CoolingModes.normal
                                  ? Colors.grey
                                  : (index == CoolingModes.normal.index) &&
                                          refrigerator.coolingMode !=
                                              CoolingModes.normal
                                      ? HexColor("ADD8E6")
                                      : index == CoolingModes.superCool.index &&
                                              refrigerator.coolingMode ==
                                                  CoolingModes.superCool
                                          ? Colors.grey
                                          : index ==
                                                      CoolingModes
                                                          .superCool.index &&
                                                  refrigerator.coolingMode !=
                                                      CoolingModes.superCool
                                              ? HexColor("1E90FF")
                                              : index ==
                                                          CoolingModes
                                                              .superFreeze
                                                              .index &&
                                                      refrigerator
                                                              .coolingMode ==
                                                          CoolingModes
                                                              .superFreeze
                                                  ? Colors.grey
                                                  : index ==
                                                              CoolingModes
                                                                  .superFreeze
                                                                  .index &&
                                                          refrigerator
                                                                  .coolingMode !=
                                                              CoolingModes
                                                                  .superFreeze
                                                      ? HexColor("004080")
                                                      : refrigerator
                                                                  .coolingMode ==
                                                              CoolingModes
                                                                  .custom
                                                          ? Colors.grey
                                                          : Colors.teal,
                            ),
                            padding: const EdgeInsets.all(2),
                            child: Center(
                              child: Reusabletext(
                                  index == CoolingModes.normal.index
                                      ? "Normal"
                                      : index == CoolingModes.superCool.index
                                          ? "Super Cool"
                                          : index ==
                                                  CoolingModes.superFreeze.index
                                              ? "Super Freeze"
                                              : "Custom",
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
          height: 200,
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Reusabletext(
                    "Fridge : ",
                    FontWeight.bold,
                    Constants.primaryColor,
                    20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (refrigerator.firdgeTemp > 1) {
                          refrigerator.firdgeTemp--;
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
                      refrigerator.firdgeTemp.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    )),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (refrigerator.firdgeTemp < 8) {
                          refrigerator.firdgeTemp++;
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
                    "Freezer : ",
                    FontWeight.bold,
                    Constants.primaryColor,
                    20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (refrigerator.freezerTemp > -30) {
                          refrigerator.freezerTemp--;
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
                      refrigerator.freezerTemp.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    )),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (refrigerator.freezerTemp < -15) {
                          refrigerator.freezerTemp++;
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
