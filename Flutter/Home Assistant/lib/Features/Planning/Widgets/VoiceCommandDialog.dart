import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Providers/RoutinesProvider.dart';
import '../../../Utils/Constants.dart';

class VoiceCommandDialog extends StatelessWidget {
  VoiceCommandDialog({super.key});

  final formKey = GlobalKey<FormState>();

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Constants.backgroundColor,
      child: Container(
        height: 330,
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
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
                      size: 33,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Provider.of<RoutineProvider>(context, listen: false)
                            .currentRoutine!
                            .startRoutineVoice = controller.text;
                        Provider.of<RoutineProvider>(context, listen: false)
                            .currentRoutine!
                            .startRoutineTime = null;
                        Provider.of<RoutineProvider>(context, listen: false)
                            .currentRoutine!
                            .days = [];
                        Navigator.of(context).pop();
                      }
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
                "Create a voice command",
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Choose a phase like \"Let's get ready\" ",
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please a valid starter";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "When i say \"Start ...\"",
                  hintStyle: TextStyle(color: Constants.primaryColor),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          width: 1.5, color: Constants.primaryColor)),
                ),
                style: TextStyle(color: Constants.primaryColor),
                cursorColor: Constants.secondaryColor,
              ),
              const SizedBox(height: 12),
              Text(
                "Each of your starters needs a unique name",
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
