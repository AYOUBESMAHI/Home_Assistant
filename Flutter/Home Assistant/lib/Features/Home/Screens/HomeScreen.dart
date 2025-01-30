import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Models/SmartClock.dart';
import 'package:home_assistant/Features/Home/Models/SmartGarage.dart';
import 'package:home_assistant/Features/Home/Models/SmartMicrowave.dart';
import 'package:home_assistant/Features/Home/Models/SmartPlug.dart';
import 'package:home_assistant/Features/Home/Models/SmartRefrigerator.dart';
import 'package:home_assistant/Features/Home/Models/SmartSpeaker.dart';
import 'package:home_assistant/Features/Home/Models/SmartThermostat.dart';
import 'package:home_assistant/Features/Home/Models/SmartTv.dart';
import 'package:home_assistant/Features/Home/Models/SmartWasher.dart';
import 'package:home_assistant/Providers/RoomsProvider.dart';
import 'package:home_assistant/Providers/SmartDevicesProvider.dart';
import 'package:home_assistant/Services/DevicesDatabaseHelper.dart';
import 'package:home_assistant/Utils/Constants.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Models/SmartLamp.dart';
import '../Widgets/RoomCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _controller;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.8, initialPage: 3);
  }

  @override
  void didChangeDependencies() async {
    bool isInitialized =
        Provider.of<RoomsProvider>(context, listen: false).isLocalInitialized;
    if (!isInitialized) {
      setState(() => isLoading = true);

      var devices = await DevicesDatabaseHelper.instance.getSmartClocks();
      Provider.of<SmartDevicesProvider>(context, listen: false)
          .setSmartClocks(devices.map((c) => SmartClock.fromMap(c)).toList());

      devices = await DevicesDatabaseHelper.instance.getSmartGarages();
      Provider.of<SmartDevicesProvider>(context, listen: false)
          .setSmartGarages(devices.map((c) => SmartGarage.fromMap(c)).toList());

      devices = await DevicesDatabaseHelper.instance.getSmartLamps();
      Provider.of<SmartDevicesProvider>(context, listen: false)
          .setSmartLamps(devices.map((c) => SmartLamp.fromMap(c)).toList());

      devices = await DevicesDatabaseHelper.instance.getSmartMicrowaves();
      Provider.of<SmartDevicesProvider>(context, listen: false)
          .setSmartMicrowaves(
              devices.map((c) => SmartMicrowave.fromMap(c)).toList());

      devices = await DevicesDatabaseHelper.instance.getSmartPlugs();
      Provider.of<SmartDevicesProvider>(context, listen: false)
          .setSmartPlugs(devices.map((c) => SmartPlug.fromMap(c)).toList());

      devices = await DevicesDatabaseHelper.instance.getSmartRefrigerators();
      Provider.of<SmartDevicesProvider>(context, listen: false)
          .setSmartRefrigerators(
              devices.map((c) => SmartRefrigerator.fromMap(c)).toList());

      devices = await DevicesDatabaseHelper.instance.getSmartSpeakers();
      Provider.of<SmartDevicesProvider>(context, listen: false)
          .setSmartSpeakers(
              devices.map((c) => SmartSpeaker.fromMap(c)).toList());

      devices = await DevicesDatabaseHelper.instance.getSmartThermostats();
      Provider.of<SmartDevicesProvider>(context, listen: false)
          .setSmartThermostats(
              devices.map((c) => SmartThermostat.fromMap(c)).toList());

      devices = await DevicesDatabaseHelper.instance.getSmartTvs();
      Provider.of<SmartDevicesProvider>(context, listen: false)
          .setSmartTvs(devices.map((c) => SmartTv.fromMap(c)).toList());

      devices = await DevicesDatabaseHelper.instance.getSmartWashers();
      Provider.of<SmartDevicesProvider>(context, listen: false)
          .setSmartWashers(devices.map((c) => SmartWasher.fromMap(c)).toList());

      setState(() => isLoading = false);
    }
    Provider.of<RoomsProvider>(context, listen: false)
        .setLocalInitialized(true);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              const Spacer(),
              SizedBox(
                height: 380,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return RoomCard(index);
                  },
                  controller: _controller,
                  itemCount: 6,
                ),
              ),
              SmoothPageIndicator(
                  controller: _controller,
                  count: 6,
                  effect: WormEffect(
                    activeDotColor: Constants.secondaryColor,
                    dotColor: Constants.accentColor,
                  ),
                  onDotClicked: (index) {
                    setState(() {
                      _controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    });
                  }),
              const Spacer(),
            ],
          );
  }
}
