import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Providers/RoutinesProvider.dart';
import '../../../Utils/Constants.dart';
import '../../../Utils/Helper_Functions.dart';

class DateTimePickerDialog extends StatefulWidget {
  const DateTimePickerDialog({super.key});

  @override
  State<DateTimePickerDialog> createState() => _DateTimePickerDialogState();
}

class _DateTimePickerDialogState extends State<DateTimePickerDialog> {
  TimeOfDay selectedTime = TimeOfDay.now();

  void timePicker() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Constants.backgroundColor,
      child: Container(
        height: 430,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    size: 33,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Provider.of<RoutineProvider>(context, listen: false)
                        .currentRoutine!
                        .startRoutineTime = selectedTime;
                    Provider.of<RoutineProvider>(context, listen: false)
                        .currentRoutine!
                        .startRoutineVoice = null;
                    Navigator.of(context).pop();
                  },
                  borderRadius: BorderRadius.circular(55),
                  child: Icon(
                    Icons.check,
                    color: Constants.primaryColor,
                    size: 33,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              "Time of Day",
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.w800,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            InkWell(
              onTap: timePicker,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Constants.accentColor,
                    border: Border.all(
                      width: 2,
                      color: Constants.accentColor,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selected Time",
                      style: TextStyle(
                        color: Constants.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      formatTimeOfDay(selectedTime),
                      style: TextStyle(
                        color: Constants.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
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
                  ),
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
                ].map((d) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 6),
                      child: GestureDetector(
                        onTap: () {
                          if (Provider.of<RoutineProvider>(context,
                                  listen: false)
                              .currentRoutine!
                              .days
                              .contains(d)) {
                            setState(() {
                              Provider.of<RoutineProvider>(context,
                                      listen: false)
                                  .currentRoutine!
                                  .days
                                  .remove(d);
                            });
                          } else {
                            setState(() {
                              Provider.of<RoutineProvider>(context,
                                      listen: false)
                                  .currentRoutine!
                                  .days
                                  .add(d);
                            });
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor: Provider.of<RoutineProvider>(context,
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
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
