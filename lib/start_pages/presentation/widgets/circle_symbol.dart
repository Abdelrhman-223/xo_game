/*
**********Project Name: xo_game
**********File Name: circle_symbol
**********Created At: 30-May-24 6:00 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_icons.dart';
import '../manager/switch_controller.dart';

class CircleSymbol extends StatelessWidget {
  const CircleSymbol({super.key, required this.oSymbol});
  final bool oSymbol;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SwitchController>(
      init: SwitchController(),
      builder: (switchController) => GestureDetector(
        onHorizontalDragUpdate: (details) {
          switchController.changeSymbol();
        },
        child: CircleAvatar(
          radius: 12,
          backgroundColor: oSymbol?AppColors.mainColor:AppColors.fourthColor,
          child: SvgPicture.asset(
            oSymbol?AppIcons.oIcon:AppIcons.xIcon,
            height: 12,
            color: AppColors.secondColor,
          ),
        ),
      )
    );
  }
}
