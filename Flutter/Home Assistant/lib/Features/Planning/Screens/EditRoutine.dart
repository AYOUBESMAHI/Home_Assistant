import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Planning/Models/Routine.dart';
import 'package:home_assistant/Features/Planning/Screens/AddAction.dart';
import 'package:home_assistant/Features/Planning/Screens/AddStarter.dart';
import 'package:home_assistant/Providers/RoutinesProvider.dart';
import 'package:home_assistant/Utils/Constants.dart';
import 'package:home_assistant/Widgets/ReusableText.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Helper_Functions.dart';
import '../Widgets/RoutineNameDialog.dart';

class EditRoutine extends StatefulWidget {
  final bool isEditing;
  const EditRoutine(this.isEditing, {super.key});

  @override
  State<EditRoutine> createState() => _EditRoutineState();
}

class _EditRoutineState extends State<EditRoutine> {
  late Routine routine;

  @override
  Widget build(BuildContext context) {
    routine =
        Provider.of<RoutineProvider>(context, listen: false).currentRoutine!;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    InkWell(
                      onTap: () async {
                        if (!widget.isEditing) {
                          await Provider.of<RoutineProvider>(context,
                                  listen: false)
                              .addRoutine(routine);
                        } else {
                          await Provider.of<RoutineProvider>(context,
                                  listen: false)
                              .delteRoutine(routine);
                        }
                        Navigator.of(context).pop();
                      },
                      borderRadius: BorderRadius.circular(55),
                      child: Icon(
                        widget.isEditing ? Icons.delete : Icons.save,
                        color: Constants.primaryColor,
                        size: 45,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 33),
                Row(
                  children: [
                    Image.asset(
                      "Assets/Icons/magic-wand.png",
                      scale: 16,
                      color: Constants.primaryColor,
                    ),
                    const SizedBox(width: 8),
                    Reusabletext(
                      routine.title,
                      FontWeight.bold,
                      Constants.primaryColor,
                      22,
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                        onTap: () {
                          showDialog(
                                  context: context,
                                  builder: (_) => RoutineNameDialog())
                              .then((val) => setState(() {}));
                        },
                        borderRadius: BorderRadius.circular(55),
                        child: Icon(
                          Icons.edit,
                          size: 33,
                          color: Constants.primaryColor,
                        ))
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Activate routine",
                      style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Switch(
                        value: routine.isActive,
                        onChanged: (val) {
                          setState(() {
                            Provider.of<RoutineProvider>(context, listen: false)
                                .currentRoutine!
                                .isActive = val;
                          });
                        })
                  ],
                ),
                const SizedBox(height: 22),
                Reusabletext(
                  "Starters",
                  FontWeight.w800,
                  Constants.primaryColor,
                  22,
                ),
                const SizedBox(height: 8),
                if (routine.startRoutineType == StartRoutineType.voice)
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (_) => const AddStarter()))
                          .then((val) => setState(() {}));
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            width: 2,
                            color: Constants.primaryColor,
                          )),
                      child: Text(
                        routine.startRoutineVoice!,
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                if (routine.startRoutineType == StartRoutineType.time)
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (_) => const AddStarter()))
                        .then((val) => setState(() {})),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 2,
                        color: Constants.primaryColor,
                      )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Selected Time",
                            style: TextStyle(
                                color: Constants.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            formatTimeOfDay(routine.startRoutineTime!),
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.repeat,
                                size: 33,
                                color: Constants.primaryColor,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "Repeats every ",
                                style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Wrap(
                            children: [
                              ...[
                                "Sun",
                                "Mon",
                                "Tue",
                                "Wed",
                                "Thu",
                                "Fri",
                                "Sat"
                              ].map(
                                (d) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 6),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Provider.of<RoutineProvider>(context,
                                                    listen: false)
                                                .currentRoutine!
                                                .days
                                                .contains(d)
                                            ? Colors.blue
                                            : Constants.accentColor,
                                    radius: 22,
                                    child: Text(
                                      d,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                if (routine.startRoutineType == null)
                  Text(
                    "Choose how this Routine will start",
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                if (routine.startRoutineType == null) const SizedBox(height: 8),
                if (routine.startRoutineType == null)
                  TextButton.icon(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (_) => const AddStarter()))
                            .then((val) => setState(() {}));
                      },
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                width: 1,
                                color: Constants.primaryColor,
                              )))),
                      icon: Icon(
                        Icons.add,
                        color: Constants.primaryColor,
                      ),
                      label: Text(
                        "Add Starter",
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                const SizedBox(height: 32),
                Reusabletext(
                  "Actions",
                  FontWeight.w800,
                  Constants.primaryColor,
                  22,
                ),
                const SizedBox(height: 12),
                if (routine.action.isNotEmpty)
                  SizedBox(
                    height: routine.action.length > 3 ? 200 : 150,
                    child: ListView.builder(
                      itemCount: routine.action.length,
                      itemBuilder: (_, index) => Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Constants.accentColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Reusabletext(
                          routine.action[index],
                          FontWeight.bold,
                          Constants.primaryColor,
                          18,
                        ),
                      ),
                    ),
                  ),
                if (routine.action.isEmpty)
                  Text(
                    "Choose actions for this Routine",
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                const SizedBox(height: 8),
                TextButton.icon(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (_) => const AddAction()))
                          .then((v) => setState(() {}));
                    },
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              width: 1,
                              color: Constants.primaryColor,
                            )))),
                    icon: Icon(
                      Icons.add,
                      color: Constants.primaryColor,
                    ),
                    label: Text(
                      "Add Action",
                      style: TextStyle(
                        color: Constants.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
