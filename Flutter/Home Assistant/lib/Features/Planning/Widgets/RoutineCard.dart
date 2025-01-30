import 'package:flutter/material.dart';
import '../../../Utils/Constants.dart';
import '../../../Widgets/ReusableText.dart';
import '../Models/Routine.dart';

class RoutineCard extends StatelessWidget {
  final Routine routine;
  const RoutineCard(
    this.routine, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Constants.accentColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            "Assets/Icons/magic-wand.png",
            scale: 14,
            color: Constants.primaryColor,
          ),
          const SizedBox(width: 12),
          Reusabletext(
            routine.title,
            FontWeight.bold,
            Constants.primaryColor,
            18,
          ),
          const Spacer(),
          CircleAvatar(
            radius: 25,
            backgroundColor: Constants.primaryColor,
            child: Icon(Icons.navigate_next,
                color: Constants.secondaryColor, size: 30),
          )
        ],
      ),
    );
  }
}
