/*
**********Project Name: xo_game
**********File Name: my_text_field
**********Created At: 30-May-24 7:30 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.fieldController});

  final TextEditingController fieldController;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: AppColors.mainShadow,
      ),
      child: TextField(
        controller: fieldController,
        cursorColor: AppColors.mainColor,
        style: TextStyle(
          color: AppColors.mainColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter Your Name",
          hintStyle: TextStyle(
            color: AppColors.thirdColor.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
