import 'package:flutter/material.dart';
import 'package:home_assistant/Features/NavigationPage.dart';
import 'package:home_assistant/Providers/RoomsProvider.dart';
import 'package:home_assistant/Providers/RoutinesProvider.dart';
import 'package:home_assistant/Providers/SmartDevicesProvider.dart';
import 'package:home_assistant/Services/RoutineDatabaseHelper.dart';
import 'package:home_assistant/Utils/Constants.dart';
import 'package:provider/provider.dart';

import 'Services/DevicesDatabaseHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DevicesDatabaseHelper.instance.database;
  await RoutineDatabaseHelper.instance.database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => SmartDevicesProvider()),
        ChangeNotifierProvider(create: (ctx) => RoomsProvider()),
        ChangeNotifierProvider(create: (ctx) => RoutineProvider()),
      ],
      child: MaterialApp(
        title: 'Home Assistant',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Constants.primaryColor,
          ),
          scaffoldBackgroundColor: Constants.backgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: Constants.accentColor,
            iconTheme: IconThemeData(color: Constants.primaryColor),
          ),
          useMaterial3: false,
        ),
        home: const NavigationPage(),
      ),
    );
  }
}
