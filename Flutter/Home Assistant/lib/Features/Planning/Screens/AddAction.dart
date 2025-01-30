import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Providers/RoutinesProvider.dart';
import '../../../Utils/Constants.dart';
import '../../../Widgets/ReusableText.dart';

class AddAction extends StatefulWidget {
  const AddAction({super.key});

  @override
  State<AddAction> createState() => _AddActionState();
}

class _AddActionState extends State<AddAction> {
  @override
  Widget build(BuildContext context) {
    var routine =
        Provider.of<RoutineProvider>(context, listen: false).currentRoutine!;
    return Scaffold(
      body: SafeArea(
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
                "Choose what the routine will do",
                FontWeight.w800,
                Constants.primaryColor,
                22,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                    itemCount: Constants.routineActions.length,
                    itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            if (routine.action
                                .contains(Constants.routineActions[index])) {
                              routine.action
                                  .remove(Constants.routineActions[index]);
                            } else {
                              routine.action
                                  .add(Constants.routineActions[index]);
                            }
                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: routine.action
                                      .contains(Constants.routineActions[index])
                                  ? Constants.accentColor
                                  : Constants.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Reusabletext(
                              Constants.routineActions[index],
                              FontWeight.bold,
                              routine.action
                                      .contains(Constants.routineActions[index])
                                  ? Constants.primaryColor
                                  : Constants.accentColor,
                              18,
                            ),
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
