/*
**********Project Name: xo_game
**********File Name: switch_controller
**********Created At: 30-May-24 5:36 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xo_game/main.dart';

class SwitchController extends GetxController {
  bool oSymbol = sharedPreferences.containsKey("playerOneSymbol")
      ? sharedPreferences.getString("playerOneSymbol") == "o"
      : true;

  changeSymbol() {
    oSymbol = !oSymbol;
    if (oSymbol) {
      sharedPreferences.setString("playerOneSymbol", "o");
      sharedPreferences.setString("playerTwoSymbol", "x");
    } else {
      sharedPreferences.setString("playerOneSymbol", "x");
      sharedPreferences.setString("playerTwoSymbol", "o");
    }
    update();
  }
}
