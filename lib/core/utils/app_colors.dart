/*
**********Project Name: xo_game
**********File Name: app_colors
**********Created At: 29-May-24 6:03 PM
**********Author: Abdelrhman Hussein
**********Description: This file contain the colors used in this app.
*/
import 'package:flutter/material.dart';

class AppColors {
  static Color mainColor = const Color.fromRGBO(0, 48, 73, 1);
  static Color secondColor = const Color.fromRGBO(253, 240, 213, 1);
  static Color thirdColor = const Color.fromRGBO(102, 155, 188, 1);
  static Color fourthColor = const Color.fromRGBO(120, 0, 0, 1);
  static Color fifthColor = const Color.fromRGBO(193, 18, 31, 1);
  static Color grayColor = const Color.fromRGBO(204, 199, 184, 1);
  static Color greenColor = const Color.fromRGBO(53, 193, 18, 1);
  static Color yalowColor = const Color.fromRGBO(255, 180, 63, 1);

  static List<BoxShadow> mainShadow = [
    BoxShadow(
      offset: const Offset(0, 0),
      color: Colors.black.withOpacity(0.25),
      blurRadius: 5,
      blurStyle: BlurStyle.outer,
    ),
  ];
  static List<BoxShadow> redShadow = [
    BoxShadow(
      offset: const Offset(0, 0),
      color: fourthColor,
      blurRadius: 5,
      blurStyle: BlurStyle.outer,
    ),
  ];
  static List<BoxShadow> blueShadow = [
    BoxShadow(
      offset: const Offset(0, 0),
      color: mainColor,
      blurRadius: 5,
      blurStyle: BlurStyle.outer,
    ),
  ];
}
