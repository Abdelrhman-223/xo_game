/*
**********Project Name: xo_game
**********File Name: user_data_field
**********Created At: 30-May-24 4:03 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xo_game/playing_page/presentation/manager/playing_controller.dart';

import '../../../core/components/user_icon.dart';
import '../../../core/styles/dividers.dart';
import '../../../core/utils/app_colors.dart';
import '../../../main.dart';

class UserDataField extends StatelessWidget {
  const UserDataField({
    super.key,
    required this.fieldIcon,
    required this.playerName,
    required this.playerNumber,
    required this.score,
  });

  final String fieldIcon, playerName, playerNumber;
  final int score;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayingController>(
      init: PlayingController(),
      builder: (playingController) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserIcon(
                size: 125,
                color: !playingController.playersTurn[playerNumber]!
                    ? AppColors.grayColor
                    : sharedPreferences.getString("player${playerNumber}Symbol") == "o"
                        ? AppColors.mainColor
                        : AppColors.fourthColor,
                icon: fieldIcon,
                withSymbol: true,
                oSymbol: sharedPreferences.getString("player${playerNumber}Symbol") == "o",
              ),
              spaceHiresontal16(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playerName,
                    style: TextStyle(
                      color: !playingController.playersTurn[playerNumber]!
                          ? AppColors.grayColor
                          : sharedPreferences.getString("player${playerNumber}Symbol") == "o"
                              ? AppColors.mainColor
                              : AppColors.fourthColor,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "Score: $score",
                    style: TextStyle(
                      color: AppColors.grayColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
