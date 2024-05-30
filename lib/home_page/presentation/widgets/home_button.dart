/*
**********Project Name: xo_game
**********File Name: home_button
**********Created At: 30-May-24 2:10 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../main.dart';

class HomeButton extends StatelessWidget {
  HomeButton({
    super.key,
    required this.buttonFunction,
    required this.buttonTitle,
    required this.buttonIcon,
  });

  final String buttonTitle, buttonIcon;
  final Function() buttonFunction;
  final double buttonHeight = 50;
  Color mainColor = sharedPreferences.getString("playerOneSymbol")! == "o"
          ? AppColors.mainColor
          : AppColors.fourthColor,
      secondColor = sharedPreferences.getString("playerOneSymbol")! == "o"
          ? AppColors.thirdColor
          : AppColors.fifthColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFunction,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: buttonHeight,
                width: MediaQuery.of(context).size.width * 0.5,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: buttonHeight + 8),
                decoration: BoxDecoration(
                  color: mainColor,
                  border: Border.all(
                    width: 5,
                    color: AppColors.secondColor,
                  ),
                  borderRadius: BorderRadius.circular(buttonHeight / 2),
                ),
                child: Text(
                  buttonTitle,
                  style: TextStyle(
                    color: AppColors.secondColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: buttonHeight,
                width: buttonHeight,
                decoration: BoxDecoration(
                  color: secondColor,
                  border: Border.all(
                    width: 5,
                    color: AppColors.secondColor,
                  ),
                  borderRadius: BorderRadius.circular(buttonHeight / 2),
                ),
                child: SizedBox(
                  width: buttonHeight * 0.3,
                  height: buttonHeight * 0.3,
                  child: SvgPicture.asset(
                    buttonIcon,
                    fit: BoxFit.scaleDown,
                    color: AppColors.secondColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
