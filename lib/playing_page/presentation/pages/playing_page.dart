/*
**********Project Name: xo_game
**********File Name: playing_page
**********Created At: 30-May-24 2:32 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xo_game/main.dart';
import 'package:xo_game/playing_page/presentation/widgets/end_game_statues.dart';
import 'package:xo_game/playing_page/presentation/widgets/user_data_field.dart';
import '../../../core/styles/dividers.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_icons.dart';
import '../../../core/utils/app_images.dart';
import '../../../home_page/presentation/pages/home_page.dart';
import '../manager/playing_controller.dart';

class PlayingPage extends StatelessWidget {
  PlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: AppColors.secondColor,
          image: DecorationImage(
            image: AssetImage(ImagePaths.appOverlayPng),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.secondColor.withOpacity(0.5),
            leadingWidth: 100,
            leading: Row(
              children: [
                spaceHiresontal16(),
                Image.asset(
                  ImagePaths.logoPng,
                  width: 50,
                ),
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Get.offAll(const MyHomePage());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SvgPicture.asset(AppIcons.home),
                ),
              ),
            ],
            shape: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.mainColor,
                width: 2,
              ),
            ),
          ),
          body: GetBuilder<PlayingController>(
              init: PlayingController(),
              builder: (playingController) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sharedPreferences.getBool("playingMode")!
                        ? UserDataField(
                            fieldIcon: AppIcons.person,
                            playerName: sharedPreferences.getString("playerTwoName")!,
                            playerNumber: "Two",
                            score: playingController.playerTwoScore,
                          )
                        : UserDataField(
                            fieldIcon: AppIcons.robot,
                            playerName: "Robot",
                            playerNumber: "Two",
                            score: playingController.playerTwoScore,
                          ),
                    SizedBox(
                      width: 3 * 100,
                      height: 3 * 100,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 9,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          maxCrossAxisExtent: 100,
                        ),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            if (sharedPreferences.getBool("playingMode")!) {
                              if (!playingController.activeCells.contains(index) &&
                                  playingController.winner == 0) {
                                playingController.activeCell(index);
                                playingController.addValue(index);
                                if (playingController.winner == 0) {
                                  playingController.changePlayerTurn();
                                }
                              }
                              if (playingController.winner != 0) {
                                showDialog(
                                  context: context,
                                  barrierColor: AppColors.secondColor.withOpacity(0.25),
                                  builder: (context) => EndGameStatues(
                                    title: playingController.winner == 1
                                        ? sharedPreferences.getString("playerOneName")!
                                        : sharedPreferences.getString("playerTwoName")!,
                                    statues: "Win",
                                    icon: ImagePaths.winnerIcon,
                                    backColor: playingController.winner == 1
                                        ? AppColors.mainColor
                                        : AppColors.fourthColor,
                                    statuesColor: AppColors.greenColor,
                                  ),
                                );
                              }
                            } else {
                              if (playingController.playersTurn["One"]!) {
                                if (!playingController.activeCells.contains(index) &&
                                    playingController.winner == 0) {
                                  playingController.activeCell(index);
                                  playingController.addValue(index);
                                  if (playingController.winner == 0 &&
                                      playingController.actionsNumber < 9) {
                                    playingController.changePlayerTurn();
                                    playingController.robotPlayInEasyLevel();
                                    /*if(sharedPreferences.getBool("playingLevel")!){
                                      playingController.robotPlayInHardLevel();
                                    }else{
                                      playingController.robotPlayInEasyLevel();
                                    }*/
                                  }
                                }
                              }
                              if (playingController.winner != 0) {
                                showDialog(
                                  context: context,
                                  barrierColor: AppColors.secondColor.withOpacity(0.25),
                                  builder: (context) => EndGameStatues(
                                    title: "You",
                                    statues: playingController.winner == 1 ? "Win" : "Loss",
                                    icon: playingController.winner == 1
                                        ? ImagePaths.winnerIcon
                                        : ImagePaths.lossIcon,
                                    backColor: AppColors.mainColor,
                                    statuesColor: playingController.winner == 1
                                        ? AppColors.greenColor
                                        : AppColors.fifthColor,
                                  ),
                                );
                              }
                            }
                            if (playingController.actionsNumber == 9 &&
                                playingController.winner == 0) {
                              showDialog(
                                context: context,
                                barrierColor: AppColors.secondColor.withOpacity(0.25),
                                builder: (context) => EndGameStatues(
                                  title: "You",
                                  statues: "Draw",
                                  icon: ImagePaths.drawIcon,
                                  backColor: AppColors.mainColor,
                                  statuesColor: AppColors.yalowColor,
                                ),
                              );
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                              color: (playingController.winner == 1 &&
                                      playingController.winnerCells.contains(index))
                                  ? AppColors.mainColor
                                  : (playingController.winner == 2 &&
                                          playingController.winnerCells.contains(index))
                                      ? AppColors.fourthColor
                                      : AppColors.secondColor,
                              boxShadow: playingController.gameValues[index] == "o"
                                  ? AppColors.blueShadow
                                  : playingController.gameValues[index] == "x"
                                      ? AppColors.redShadow
                                      : AppColors.mainShadow,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: (playingController.activeCells.contains(index))
                                ? SvgPicture.asset(
                                    fit: BoxFit.scaleDown,
                                    playingController.gameValues[index] == "o"
                                        ? AppIcons.oIcon
                                        : AppIcons.xIcon,
                                    color: (playingController.winner != 0 &&
                                            playingController.winnerCells.contains(index))
                                        ? AppColors.secondColor
                                        : playingController.gameValues[index] == "o"
                                            ? AppColors.mainColor
                                            : AppColors.fourthColor,
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ),
                    UserDataField(
                      fieldIcon: AppIcons.person,
                      playerName: sharedPreferences.getString("playerOneName")!,
                      playerNumber: "One",
                      score: playingController.playerOneScore,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
