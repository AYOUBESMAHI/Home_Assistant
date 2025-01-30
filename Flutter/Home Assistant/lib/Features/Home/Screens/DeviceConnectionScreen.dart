import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Widgets/ManualConnection.dart';

import '../../../Utils/Constants.dart';
import '../../../Widgets/ReusableText.dart';
// import '../Widgets/QrScanner.dart';

class DeviceConnectionScreen extends StatefulWidget {
  const DeviceConnectionScreen({super.key});

  @override
  State<DeviceConnectionScreen> createState() => _DeviceConnectionScreenState();
}

class _DeviceConnectionScreenState extends State<DeviceConnectionScreen>
    with TickerProviderStateMixin {
  // late TabController _controller;
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = TabController(length: 2, vsync: this);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Reusabletext(
          "Connect To Device",
          FontWeight.bold,
          Constants.primaryColor,
          22,
        ),
        // bottom: TabBar(
        //   tabs: const [
        //     Tab(text: "SCAN"),
        //     Tab(text: "MANUAL"),
        //   ],
        //   labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        //   controller: _controller,
        // ),
      ),
      // body: TabBarView(controller: _controller, children: [
      //   const QrScanner(),
      //   //const Text("data"),
      //   ManualConnection(),
      // ]),
      body: ManualConnection(),
    );
  }
}
