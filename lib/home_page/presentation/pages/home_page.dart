/*
**********Project Name: xo_game
**********File Name: home_page
**********Created At: 29-May-24 6:03 PM
**********Author: Abdelrhman Hussein
**********Description: The start page that contain action buttons (Play, New Game, Settings).
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xo_game/core/components/user_icon.dart';
import 'package:xo_game/core/styles/dividers.dart';
import 'package:xo_game/core/utils/app_icons.dart';
import 'package:xo_game/home_page/presentation/widgets/home_button.dart';
import 'package:xo_game/main.dart';
import 'package:xo_game/playing_page/presentation/pages/playing_page.dart';
import 'package:xo_game/start_pages/presentation/pages/choose_mode.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /*appBar: AppBar(
          backgroundColor: AppColors.secondColor,
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
              onTap: (){
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
        ),*/
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 128,
                  bottom: 64,
                ),
                child: Image.asset(
                  ImagePaths.logoPng,
                  width: 200,
                ),
              ),
              //User Data if you need it.
              /*Text(
                  "Playing Mode: ${sharedPreferences.getBool("playingMode")! ? "Multi Players" : "Single Player"}"),
              Text(
                  "Playing Level: ${sharedPreferences.getBool("playingLevel")! ? "Hard" : "Easy"}"),
              Text(
                  "Timer: ${sharedPreferences.getBool("withTimer")! ? "With Timer" : "Without Timer"}"),
              if (sharedPreferences.getBool("playingMode")!)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Player Two Name: ${sharedPreferences.getString("playerTwoName")!}"),
                    Text("Player Two Symbol: ${sharedPreferences.getString("playerTwoSymbol")!}"),
                  ],
                ),*/
              UserIcon(
                size: 125,
                color: sharedPreferences.getString("playerOneSymbol")! == "o"
                    ? AppColors.mainColor
                    : AppColors.fourthColor,
                icon: AppIcons.person,
                withSymbol: true,
                oSymbol: sharedPreferences.getString("playerOneSymbol")! == "o",
              ),
              Text(
                sharedPreferences.getString("playerOneName")!,
                softWrap: true,
                style: TextStyle(
                  fontSize: 24,
                  color: sharedPreferences.getString("playerOneSymbol")! == "o"
                      ? AppColors.mainColor
                      : AppColors.fourthColor,
                ),
              ),
              spaceVertical16(),
              HomeButton(
                buttonFunction: () {
                  Get.off( PlayingPage());
                },
                buttonTitle: "Play",
                buttonIcon: AppIcons.play,
              ),
              HomeButton(
                buttonFunction: () {
                  Get.to(ChooseMode());
                },
                buttonTitle: "New Game",
                buttonIcon: AppIcons.playCircle,
              ),
              HomeButton(
                buttonFunction: () {
                  Get.off( PlayingPage());
                },
                buttonTitle: "Settings",
                buttonIcon: AppIcons.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
