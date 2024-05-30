/*
**********Project Name: xo_game
**********File Name: app_custom_button
**********Created At: 30-May-24 7:46 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class AppCustomButton extends StatelessWidget {
  const AppCustomButton({
    super.key,
    required this.buttonTitle,
    required this.buttonFunction,
    this.buttonColor,
  });

  final String buttonTitle;
  final Color? buttonColor;
  final Function() buttonFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFunction,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.mainColor,
          border: Border.all(
            width: 5,
            color: AppColors.secondColor,
          ),
          borderRadius: BorderRadius.circular(50),
          boxShadow: AppColors.mainShadow,
        ),
        child: Text(
          buttonTitle,
          style: TextStyle(
            color: AppColors.secondColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
