import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Constants {
  static var navBarIcons = [
    Container(
      padding: const EdgeInsets.all(10),
      child: Image.asset(
        "Assets/Icons/smart-home.png",
        color: primaryColor,
      ),
    ),
    Container(
      padding: const EdgeInsets.all(10),
      child: Image.asset(
        "Assets/Icons/ai-technology.png",
        color: primaryColor,
      ),
    ),
    Container(
      padding: const EdgeInsets.all(7),
      child: Image.asset(
        "Assets/Icons/business-chart.png",
        color: primaryColor,
      ),
    ),
    Container(
      padding: const EdgeInsets.all(10),
      child: Image.asset(
        "Assets/Icons/setting.png",
        color: primaryColor,
      ),
    ),
  ];

  static var primaryColor = HexColor("C9DABF");
  static var secondaryColor = HexColor("9CA986");
  static var accentColor = HexColor("5F6F65");
  static var backgroundColor = HexColor("808D7C");

  static var roomsImages = [
    "Assets/Images/Living room.jpg",
    "Assets/Images/Bedroom.jpg",
    "Assets/Images/Kitchen.jpg",
    "Assets/Images/Bathroom.jpg",
    "Assets/Images/Dining Room.jpg",
    "Assets/Images/Garage.jpg",
  ];
  static var roomsNames = [
    "Living Room",
    "Bedroom",
    "Kitchen",
    "Bathroom",
    "Dining Room",
    "Garage",
  ];

  static var tvImages = [
    "Assets/Icons/television.png",
    "Assets/Icons/netflix.png",
    "Assets/Icons/Youtube.png",
    "Assets/Icons/google.png",
    "Assets/Icons/iptv.png",
    "Assets/Icons/game-controller.png",
    "Assets/Icons/google-play.png",
  ];
  static var tvNames = [
    "Tv Channels",
    "Netflix",
    "Youtube",
    "Google",
    "Iptv",
    "Google Play",
    "Games",
  ];

  static const List<String> playlist = [
    "Réseaux - Niska",
    "Blanche - SCH",
    "Maman ne le sait pas - Ninho ft. Niska",
    "Petrouchka - Soso Maness ft. PLK",
    "93 Empire - Sofiane ft. 93 Empire",
    "Suicide social - Orelsan",
    "Django - Dadju ft. Franglish",
    "À l'Ammoniaque - PNL",
    "Wesh Morray - Booba",
    "Khapta - Heuss L'enfoiré ft. Sofiane",
    "Au DD - PNL",
    "Basique - Orelsan",
    "Rohff vs. La Fouine - Kery James",
    "Mwaka Moon - Kalash ft. Damso",
    "VVS - Leto ft. Ninho",
    "Validé - Booba",
    "Freestyle PSG - Ninho",
    "Mortel - Lomepal",
    "Ma meilleure amie - Kaaris",
    "Jeune Loup - Vald",
    "Le monde ou rien - PNL",
    "Bande organisée - Jul ft. 13 Organisé",
    "Tomber pour elle - L'Algérino",
    "Adieu Merci - Kaaris",
    "Goutte d'eau - Ninho",
    "Périscope - Booba",
    "Naha - PNL",
    "Ma 6-T va crack-er - Stomy Bugsy",
    "Macarena - Damso",
    "Temps mort - Booba",
  ];

  static const cookingModesIcons = [
    "Assets/Icons/chicken.png",
    "Assets/Icons/steak.png",
    "Assets/Icons/chicken-leg.png",
    "Assets/Icons/shrimp.png",
    "Assets/Icons/fries.png",
    "Assets/Icons/vegetable.png",
    "Assets/Icons/fish.png",
    "Assets/Icons/pie.png",
    "Assets/Icons/menu.png",
  ];

  static const List<Map<String, Color>> washModesColors = [
    {"Standard Wash": Color(0xFFADD8E6)},
    {"Delicate Wash": Color(0xFFFFC0CB)},
    {"Quick Wash": Color(0xFFFFD700)},
    {"Heavy-Duty Wash": Color(0xFF8B0000)},
    {"Eco Wash": Color(0xFF32CD32)},
    {"Spin Cycle": Color(0xFFA9A9A9)},
    {"Rinse & Spin": Color(0xFF87CEEB)},
    {"Steam Clean": Color(0xFFC0C0C0)},
    {"Wool Wash": Color(0xFFD2B48C)},
    {"Custom": Color(0xFF9370DB)},
  ];
  static const List<String> smartLampColors = [
    "FFFF0000", // Red
    "FF00FF00", // Green
    "FF0000FF", // Blue
    "FFFFFF00", // Yellow
    "FFFFA500", // Orange
    "FF800080", // Purple
    "FF00FFFF", // Cyan
    "FFFFC0CB", // Pink
    "FF8B4513", // Brown
    "FF808080", // Grey
    "FFFFFFFF", // White
    "FFFF1493", // Deep Pink
    "FFADFF2F", // Green Yellow
    "FF1E90FF", // Dodger Blue
    "FFFF6347", // Tomato
    "FF40E0D0", // Turquoise
    "FF7FFF00", // Chartreuse
    "FFDC143C", // Crimson
    "FFFF4500", // Orange Red
    "FFFFD700", // Gold
    "FF4B0082", // Indigo
    "FF00FF7F", // Spring Green
    "FF4682B4", // Steel Blue
    "FF6A5ACD", // Slate Blue
    "FF2E8B57", // Sea Green
    "FFFFE4B5", // Moccasin
    "FFB22222", // Firebrick
    "FF8A2BE2", // Blue Violet
    "FF5F9EA0", // Cadet Blue
    "FFD2691E", // Chocolate
    "FFB0E0E6", // Powder Blue
    "FF20B2AA", // Light Sea Green
    "FF87CEFA", // Light Sky Blue
    "FFFA8072", // Salmon
    "FF228B22", // Forest Green
    "FFFF69B4", // Hot Pink
    "FFB8860B", // Dark Goldenrod
    "FFDAA520", // Goldenrod
    "FF7CFC00", // Lawn Green
    "FF00BFFF", // Deep Sky Blue
    "FF9932CC", // Dark Orchid
    "FFE9967A", // Dark Salmon
    "FF8FBC8F", // Dark Sea Green
    "FFDB7093", // Pale Violet Red
    "FFFAEBD7", // Antique White
    "FF778899", // Light Slate Gray
    "FFCD5C5C", // Indian Red
    "FF66CDAA", // Medium Aquamarine
    "FF191970", // Midnight Blue
    "FFFFD700", // Gold
    "FF7B68EE", // Medium Slate Blue
  ];

  static const List<String> routineActions = [
    "Turn on the lights",
    "Turn off the lights",
    "Set the thermostat to 22°C",
    "Play music",
    "Pause music",
    "Lock the doors",
    "Unlock the doors",
    "Turn on the coffee machine",
    "Turn off the TV",
    "Activate security cameras",
    "Start vacuum cleaning",
    "Turn on the air purifier",
    "Set lighting to night mode",
    "Dim the lights to 50%",
    "Start the washing machine",
    "Turn on the heater",
    "Set the alarm",
    "Start the dishwasher",
    "Open the garage door",
    "Turn off the air conditioner",
  ];
}

List<dynamic> allDevices = [
  {
    "name": "LED Smart Bulb",
    "image": "Assets/Images/Devices/Smart-Bulb.png",
    "rooms": [0, 1, 2, 3, 4, 5]
  },
  {
    "name": "Smart Tv",
    "image": "Assets/Images/Devices/smartTv.png",
    "rooms": [0, 1, 4]
  },
  {
    "name": "Smart Thermostat",
    "image": "Assets/Images/Devices/thermostatspng.png",
    "rooms": [0, 1, 3, 4]
  },
  {
    "name": "Smart Speaker",
    "image": "Assets/Images/Devices/Smart Speacker.png",
    "rooms": [0, 4]
  },
  {
    "name": "Smart Clock",
    "image": "Assets/Images/Devices/Smart Clock.png",
    "rooms": [1]
  },
  {
    "name": "Smart Refrigerator",
    "image": "Assets/Images/Devices/Smart refrigerator.png",
    "rooms": [2]
  },
  {
    "name": "Smart Microwave",
    "image": "Assets/Images/Devices/smart microwave.png",
    "rooms": [2]
  },
  {
    "name": "Smart Washing Machine",
    "image": "Assets/Images/Devices/washing machine.png",
    "rooms": [2]
  },
  {
    "name": "Smart Garage",
    "image": "Assets/Images/Devices/Smart Garage.png",
    "rooms": [5]
  },
  {
    "name": "Smart Plug",
    "image": "Assets/Images/Devices/Smart plugs.png",
    "rooms": [0, 1, 2, 3, 4, 5]
  }
];
