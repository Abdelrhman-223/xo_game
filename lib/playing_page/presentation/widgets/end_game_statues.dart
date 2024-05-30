/*
**********Project Name: xo_game
**********File Name: end_game_statues
**********Created At: 30-May-24 8:48 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xo_game/playing_page/presentation/manager/playing_controller.dart';

import '../../../core/styles/dividers.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_icons.dart';
import '../../../core/utils/app_images.dart';
import '../../../home_page/presentation/pages/home_page.dart';
import '../../../start_pages/presentation/widgets/app_custom_button.dart';

class EndGameStatues extends StatelessWidget {
  const EndGameStatues({
    super.key,
    required this.title,
    required this.statues,
    required this.icon,
    required this.backColor,
    required this.statuesColor,
  });

  final String title, statues, icon;
  final Color backColor, statuesColor;
  final double dialogButtonHeight = 50;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayingController>(
        init: PlayingController(),
        builder: (playingController) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            content: Stack(
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      color: backColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: AppColors.secondColor,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          statues,
                          style: TextStyle(
                            color: statuesColor,
                            fontSize: 36,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.35),
                  child: SvgPicture.asset(
                    icon,
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppCustomButton(
                        buttonTitle: "Play Again",
                        buttonColor: backColor,
                        buttonFunction: () {
                          playingController.clearPlayingPage();
                          Navigator.pop(context);
                        },
                      ),
                      spaceHiresontal16(),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(const MyHomePage());
                        },
                        child: Container(
                          height: dialogButtonHeight,
                          width: dialogButtonHeight,
                          decoration: BoxDecoration(
                            color: backColor,
                            border: Border.all(
                              width: 5,
                              color: AppColors.secondColor,
                            ),
                            borderRadius: BorderRadius.circular(dialogButtonHeight / 2),
                          ),
                          child: SizedBox(
                            width: dialogButtonHeight * 0.3,
                            height: dialogButtonHeight * 0.3,
                            child: SvgPicture.asset(
                              AppIcons.home,
                              fit: BoxFit.scaleDown,
                              color: AppColors.secondColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
