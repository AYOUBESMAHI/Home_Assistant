import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Planning/Screens/EditRoutine.dart';
import 'package:home_assistant/Providers/RoutinesProvider.dart';
import 'package:home_assistant/Utils/Constants.dart';
import 'package:home_assistant/Widgets/ReusableText.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../Models/Routine.dart';
import '../Widgets/RoutineCard.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({super.key});

  @override
  State<PlanningScreen> createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  @override
  void initState() {
    super.initState();
  }

  var isInitialized = false;
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    isInitialized =
        Provider.of<RoutineProvider>(context, listen: false).isLocalInitialized;
    if (!isInitialized) {
      await Provider.of<RoutineProvider>(context, listen: false).getRoutines();
      Provider.of<RoutineProvider>(context, listen: false)
          .setLocalInitialized(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    var routines = Provider.of<RoutineProvider>(context, listen: true).routines;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: UniqueKey(),
        key: UniqueKey(),
        onPressed: () {
          Provider.of<RoutineProvider>(context, listen: false).currentRoutine =
              Routine(Uuid().v4(), false, "Untitled", [], null, null, null, []);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => EditRoutine(false)))
              .then((v) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
      body: !isInitialized
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Reusabletext(
                    "Personal Routines",
                    FontWeight.w900,
                    Constants.primaryColor,
                    32,
                  ),
                  const SizedBox(height: 12),
                  if (routines.isEmpty)
                    Expanded(
                      child: Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Add a personal routine to get started",
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  if (routines.isNotEmpty)
                    Expanded(
                        child: ListView.builder(
                      itemCount: routines.length,
                      itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            Provider.of<RoutineProvider>(context, listen: false)
                                .currentRoutine = routines[index];
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (_) => EditRoutine(true)))
                                .then((v) => setState(() {}));
                          },
                          child: RoutineCard(routines[index])),
                    ))
                ],
              ),
            ),
    );
  }
}
