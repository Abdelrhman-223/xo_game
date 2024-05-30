/*
**********Project Name: xo_game
**********File Name: splash_screen
**********Created At: 29-May-24 6:05 PM
**********Author: Abdelrhman Hussein
**********Description: Page that show the logo until the app load.
*/

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/core/utils/app_images.dart';
import 'package:xo_game/home_page/presentation/pages/home_page.dart';
import 'package:xo_game/main.dart';
import 'package:xo_game/start_pages/presentation/pages/choose_mode.dart';

import '../../../core/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondColor,
          image: DecorationImage(
            image: AssetImage(ImagePaths.appOverlayPng),
            fit: BoxFit.fill,
          ),
        ),
        child: AnimatedSplashScreen(
          backgroundColor: Colors.transparent,
          splashIconSize: 150,
          nextScreen: sharedPreferences.getBool("firstLunch")! ? ChooseMode() : const MyHomePage(),
          splash: Center(
            child: Align(
              alignment: const Alignment(0, 0),
              child: Image.asset(ImagePaths.logoPng),
            ),
          ),
        ),
      ),
    );
  }
}
