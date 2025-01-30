import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Screens/RoomScreen.dart';
import 'package:home_assistant/Providers/RoomsProvider.dart';
import 'package:home_assistant/Widgets/ReusableText.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Constants.dart';

class RoomCard extends StatelessWidget {
  final int index;
  const RoomCard(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<RoomsProvider>(context, listen: false)
            .setCurrentRoomIndex(index);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => RoomScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(Constants.roomsImages[index]),
              ),
              boxShadow: [
                BoxShadow(
                  color: Constants.primaryColor,
                  blurRadius: 3.0,
                  spreadRadius: 1.0,
                )
              ]),
          child: Stack(
            children: [
              Positioned(
                bottom: 12,
                left: 12,
                child: Reusabletext(
                  Constants.roomsNames[index],
                  FontWeight.bold,
                  Colors.white,
                  22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
