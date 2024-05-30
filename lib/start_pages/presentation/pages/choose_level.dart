/*
**********Project Name: xo_game
**********File Name: choose_level
**********Created At: 30-May-24 9:17 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xo_game/core/styles/dividers.dart';
import 'package:xo_game/core/utils/app_colors.dart';
import 'package:xo_game/core/utils/app_icons.dart';
import 'package:xo_game/home_page/presentation/pages/home_page.dart';
import 'package:xo_game/main.dart';
import 'package:xo_game/playing_page/presentation/pages/playing_page.dart';
import 'package:xo_game/start_pages/presentation/widgets/app_custom_button.dart';
import '../../../core/utils/app_images.dart';

class ChooseLevel extends StatelessWidget {
  ChooseLevel({super.key});

  bool selectedPlayingLevel = false, withTimer = false;

  // selectedPlayingMode: false = Easy & true = Hard.

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
                    if(!sharedPreferences.getBool("playingMode")!)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPlayingLevel = !selectedPlayingLevel;
                            });
                          },
                          child: Column(
                            children: [
                              !selectedPlayingLevel
                                  ? SvgPicture.asset(
                                      AppIcons.smileFace,
                                      width: 150,
                                    )
                                  : SvgPicture.asset(
                                      AppIcons.graySmileFace,
                                      width: 100,
                                    ),
                              Text(
                                "Easy",
                                style: TextStyle(
                                  color: !selectedPlayingLevel
                                      ? AppColors.mainColor
                                      : AppColors.grayColor,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPlayingLevel = !selectedPlayingLevel;
                            });
                          },
                          child: Column(
                            children: [
                              selectedPlayingLevel
                                  ? SvgPicture.asset(
                                      AppIcons.coolFace,
                                      width: 150,
                                    )
                                  : SvgPicture.asset(
                                      AppIcons.grayCoolFace,
                                      width: 100,
                                    ),
                              Text(
                                "Hard",
                                style: TextStyle(
                                  color: selectedPlayingLevel
                                      ? AppColors.mainColor
                                      : AppColors.grayColor,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    /*
                    spaceVertical32(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          withTimer = !withTimer;
                        });
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            withTimer ? AppIcons.timer : AppIcons.grayTimer,
                            width: 75,
                          ),
                          Text(
                            withTimer ? "With Timer" : "Without Timer",
                            style: TextStyle(
                              color: withTimer ? AppColors.mainColor : AppColors.grayColor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),*/
                    spaceVertical32(),
                    AppCustomButton(
                      buttonTitle: "GO",
                      buttonFunction: () {
                        sharedPreferences.setBool("firstLunch", false);
                        // false = easy & true = hard.
                        sharedPreferences.setBool("playingLevel", selectedPlayingLevel);
                        sharedPreferences.setBool("withTimer", withTimer);
                        Get.offAll(PlayingPage());
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
