import 'package:flutter/material.dart';
import 'package:home_assistant/Services/RoutineDatabaseHelper.dart';

import '../Features/Planning/Models/Routine.dart';

class RoutineProvider extends ChangeNotifier {
  Routine? currentRoutine;
  List<Routine> routines = [];
  bool isLocalInitialized = false;
  setLocalInitialized(value) => isLocalInitialized = value;

  Future<void> addRoutine(Routine routine) async {
    await RoutineDatabaseHelper.instance.insertRoutine(routine);
    routines.add(routine);
    notifyListeners();
  }

  Future<void> updateRoutine(Routine routine) async {
    await RoutineDatabaseHelper.instance.updateRoutine(routine);
    int index = routines.indexWhere((r) => r.id == routine.id);
    routines[index] = routine;
    notifyListeners();
  }

  Future<void> delteRoutine(Routine routine) async {
    await RoutineDatabaseHelper.instance.deleteRoutine(routine.id);
    routines.removeWhere((r) => r.id == routine.id);
    notifyListeners();
  }

  Future<void> getRoutines() async {
    routines = await RoutineDatabaseHelper.instance.getRoutines();
    notifyListeners();
  }
}
