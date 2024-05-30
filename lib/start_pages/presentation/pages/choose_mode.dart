/*
**********Project Name: xo_game
**********File Name: choose_mode
**********Created At: 29-May-24 8:21 PM
**********Author: Abdelrhman Hussein
**********Description: View the start screens that take the user name and playing mode and level.
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xo_game/core/components/user_icon.dart';
import 'package:xo_game/core/styles/dividers.dart';
import 'package:xo_game/core/utils/app_colors.dart';
import 'package:xo_game/core/utils/app_icons.dart';
import 'package:xo_game/main.dart';
import 'package:xo_game/start_pages/presentation/pages/choose_level.dart';
import 'package:xo_game/start_pages/presentation/pages/enter_players_names.dart';
import 'package:xo_game/start_pages/presentation/widgets/app_custom_button.dart';

import '../../../core/utils/app_images.dart';

class ChooseMode extends StatelessWidget {
  ChooseMode({super.key});

  bool selectedPlayingMode = sharedPreferences.containsKey("playingMode")
      ? sharedPreferences.getBool("playingMode")!
      : false;

  // false = single player & true = multi players.

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondColor,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: AppColors.secondColor,
            image: DecorationImage(
              image: AssetImage(ImagePaths.appOverlayPng),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 64,
                  bottom: 64,
                ),
                child: Image.asset(
                  ImagePaths.logoPng,
                  width: 200,
                ),
              ),
              StatefulBuilder(
                builder: (context, setState) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPlayingMode = !selectedPlayingMode;
                            });
                          },
                          child: Column(
                            children: [
                              UserIcon(
                                size: !selectedPlayingMode ? 150 : 100,
                                color: !selectedPlayingMode
                                    ? AppColors.mainColor
                                    : AppColors.thirdColor,
                                icon: AppIcons.person,
                              ),
                              Text(
                                "Single Player",
                                style: TextStyle(
                                  color: !selectedPlayingMode
                                      ? AppColors.mainColor
                                      : AppColors.thirdColor,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPlayingMode = !selectedPlayingMode;
                            });
                          },
                          child: Center(
                            child: Column(
                              children: [
                                UserIcon(
                                  size: selectedPlayingMode ? 150 : 100,
                                  color: selectedPlayingMode
                                      ? AppColors.mainColor
                                      : AppColors.thirdColor,
                                  icon: AppIcons.group,
                                ),
                                Text(
                                  "Multi Players",
                                  style: TextStyle(
                                    color: selectedPlayingMode
                                        ? AppColors.mainColor
                                        : AppColors.thirdColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    spaceVertical32(),
                    AppCustomButton(
                      buttonTitle: "Ready",
                      buttonFunction: () {
                        // false = single player & true = multi players.
                        sharedPreferences.setBool("playingMode", selectedPlayingMode);

                        if (sharedPreferences.getBool("firstLunch")! || selectedPlayingMode) {
                          Get.to(EnterPlayersNames(selectedPlayingMode: selectedPlayingMode));
                        } else {
                          Get.to(ChooseLevel());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
