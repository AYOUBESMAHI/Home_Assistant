import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Planning/Models/Routine.dart';
import 'package:home_assistant/Features/Planning/Widgets/StarterChoiceCard.dart';
import 'package:provider/provider.dart';

import '../../../Providers/RoutinesProvider.dart';
import '../../../Utils/Constants.dart';
import '../../../Widgets/ReusableText.dart';
import '../Widgets/DateTimePickerDialog.dart';
import '../Widgets/VoiceCommandDialog.dart';

class AddStarter extends StatelessWidget {
  const AddStarter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  borderRadius: BorderRadius.circular(55),
                  child: Icon(
                    Icons.close,
                    color: Constants.primaryColor,
                    size: 45,
                  ),
                ),
                Reusabletext(
                  "Add starter",
                  FontWeight.w800,
                  Constants.primaryColor,
                  22,
                ),
                const SizedBox(height: 8),
                Text(
                  "Choose how this Routine will start",
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 12),
                StarterChoiceCard(
                    Icons.keyboard_voice, "When I say to Voice Assistant", () {
                  Provider.of<RoutineProvider>(context, listen: false)
                      .currentRoutine!
                      .startRoutineType = StartRoutineType.voice;
                  showDialog(
                    context: context,
                    builder: (_) => VoiceCommandDialog(),
                  ).then(((v) => Navigator.of(context).pop()));
                }),
                StarterChoiceCard(
                  Icons.access_time_filled,
                  "At a specific time",
                  () {
                    Provider.of<RoutineProvider>(context, listen: false)
                        .currentRoutine!
                        .startRoutineType = StartRoutineType.time;
                    showDialog(
                      context: context,
                      builder: (_) => const DateTimePickerDialog(),
                    ).then((v) => Navigator.of(context).pop());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
