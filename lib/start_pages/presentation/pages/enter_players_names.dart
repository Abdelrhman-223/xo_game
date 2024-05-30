/*
**********Project Name: xo_game
**********File Name: enter_players_names
**********Created At: 30-May-24 8:15 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xo_game/core/components/user_icon.dart';
import 'package:xo_game/core/styles/dividers.dart';
import 'package:xo_game/core/utils/app_colors.dart';
import 'package:xo_game/core/utils/app_icons.dart';
import 'package:xo_game/main.dart';
import 'package:xo_game/start_pages/presentation/pages/choose_level.dart';
import 'package:xo_game/start_pages/presentation/widgets/app_custom_button.dart';
import 'package:xo_game/start_pages/presentation/widgets/my_text_field.dart';
import 'package:xo_game/start_pages/presentation/widgets/switch_symbol_button.dart';
import '../../../core/utils/app_images.dart';

class EnterPlayersNames extends StatelessWidget {
  EnterPlayersNames({super.key, required this.selectedPlayingMode});

  final bool selectedPlayingMode;
  TextEditingController playerOneController = TextEditingController();
  TextEditingController playerTwoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (sharedPreferences.containsKey("playerOneName")){
      playerOneController.text = sharedPreferences.getString("playerOneName")!;
    }
    if (sharedPreferences.containsKey("playerTwoName")){
      playerTwoController.text = sharedPreferences.getString("playerTwoName")!;
    }
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                margin: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                decoration: BoxDecoration(
                  color: AppColors.thirdColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: AppColors.mainShadow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserIcon(
                      size: 110,
                      color: AppColors.thirdColor,
                      icon: !selectedPlayingMode? AppIcons.person: AppIcons.group,
                    ),
                    spaceVertical16(),
                    selectedPlayingMode? SwitchSymbolButton(
                      playerOne: true,
                    ):
                    Text(
                      "Player 1",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.mainColor,
                      ),
                    ),
                    spaceVertical16(),
                    MyTextField(
                      fieldController: playerOneController,
                    ),
                    spaceVertical16(),
                    if (selectedPlayingMode)
                      Column(
                        children: [
                          Text(
                            "Player 1 is the MAIN player",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.secondColor,
                            ),
                          ),
                          spaceVertical16(),
                          SwitchSymbolButton(
                            playerOne: false,
                          ),
                          spaceVertical16(),
                          MyTextField(
                            fieldController: playerTwoController,
                          ),
                          spaceVertical16(),
                        ],
                      ),
                    AppCustomButton(
                      buttonTitle: "Steady",
                      buttonFunction: () {
                        sharedPreferences.setString("playerOneName", playerOneController.text);
                        if(selectedPlayingMode) {
                          sharedPreferences.setString("playerTwoName", playerTwoController.text);
                        }
                        Get.to(ChooseLevel());
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
