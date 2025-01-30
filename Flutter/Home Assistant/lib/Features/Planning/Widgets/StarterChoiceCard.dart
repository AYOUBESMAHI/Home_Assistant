import 'package:flutter/material.dart';

import '../../../Utils/Constants.dart';

class StarterChoiceCard extends StatelessWidget {
  final icon;
  final title;
  final onPress;
  const StarterChoiceCard(this.icon, this.title, this.onPress, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1.5,
          color: Constants.primaryColor,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 33,
            color: Constants.primaryColor,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          CircleAvatar(
            radius: 25,
            backgroundColor: Constants.primaryColor,
            child: IconButton(
              onPressed: onPress,
              color: Constants.secondaryColor,
              iconSize: 30,
              icon: const Icon(Icons.navigate_next),
            ),
          )
        ],
      ),
    );
  }
}
