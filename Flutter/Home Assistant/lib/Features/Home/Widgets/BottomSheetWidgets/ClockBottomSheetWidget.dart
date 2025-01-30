import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Models/SmartClock.dart';
import 'package:home_assistant/Providers/RoomsProvider.dart';
import 'package:home_assistant/Utils/Constants.dart';
import 'package:home_assistant/Widgets/ReusableText.dart';
import 'package:provider/provider.dart';

class ClockBottomSheetWidget extends StatefulWidget {
  const ClockBottomSheetWidget({super.key});

  @override
  State<ClockBottomSheetWidget> createState() => _ClockBottomSheetWidgetState();
}

class _ClockBottomSheetWidgetState extends State<ClockBottomSheetWidget> {
  late SmartClock clock;
  @override
  void initState() {
    clock = Provider.of<RoomsProvider>(context, listen: false).smartDevice
        as SmartClock;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<RoomsProvider>(context, listen: false).setSmartDevice(clock);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 400,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    clock.isOn = !clock.isOn;
                  });
                },
                child: Image.asset(
                  "Assets/Images/power-on.png",
                  scale: 8,
                  color: clock.isOn ? Colors.green : Colors.red,
                ),
              ),
              if (clock.isOn)
                Expanded(
                  child: Slider(
                    value: clock.volume,
                    onChanged: (val) {
                      setState(() => clock..volume = val);
                    },
                    label: clock.volume.round().toString(),
                    max: 100,
                    divisions: 10,
                  ),
                )
            ],
          ),
          const SizedBox(height: 18),
          if (clock.isOn)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Reusabletext(
                  clock.alarm == null
                      ? "No alarm is currently set. Please configure your alarm to ensure you wake up on time."
                      : "Alarm is set for ${clock.alarm!.hour.toString().padLeft(2, '0')}:${clock.alarm!.minute.toString().padLeft(2, '0')} ${clock.alarm!.period.name.toUpperCase()}. Don't forget to have a great start to your day!",
                  FontWeight.bold,
                  Constants.accentColor,
                  22),
            ),
          const SizedBox(height: 18),
          if (clock.isOn)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (picked != null) {
                        setState(() {
                          clock.alarm = picked;
                        });
                      }
                    },
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)))),
                    child: const Text("Set Alarm")),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      clock.alarm = null;
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(Colors.red),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
                  child: const Text("Delete Alarm"),
                )
              ],
            )
        ]),
      ),
    );
  }
}
