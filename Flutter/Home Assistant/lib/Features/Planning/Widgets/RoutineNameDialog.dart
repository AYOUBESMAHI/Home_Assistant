import 'package:flutter/material.dart';
import 'package:home_assistant/Providers/RoutinesProvider.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Constants.dart';

class RoutineNameDialog extends StatelessWidget {
  RoutineNameDialog({super.key});

  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Constants.backgroundColor,
      child: Container(
        height: 230,
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
                            .title = controller.text.toString();
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
              TextFormField(
                controller: controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please a valid name";
                  }
                  return null;
                },
                maxLength: 16,
                decoration: InputDecoration(
                  hintText: "Routine name",
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
                "Each of your Routines needs a unique name",
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
