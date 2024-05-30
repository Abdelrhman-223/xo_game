/*
**********Project Name: xo_game
**********File Name: switch_symbol_button
**********Created At: 30-May-24 4:45 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:xo_game/start_pages/presentation/manager/switch_controller.dart';
import 'package:xo_game/start_pages/presentation/widgets/circle_symbol.dart';
import 'package:xo_game/start_pages/presentation/widgets/text_symbol.dart';

import '../../../core/styles/dividers.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_icons.dart';

class SwitchSymbolButton extends StatelessWidget {
  SwitchSymbolButton({super.key, required this.playerOne});

  final bool playerOne;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SwitchController>(
      init: SwitchController(),
      builder: (switchController) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Player ${playerOne ? "1" : "2"}",
            style: TextStyle(
              fontSize: 18,
              color: playerOne
                  ? switchController.oSymbol
                      ? AppColors.mainColor
                      : AppColors.fourthColor
                  : !switchController.oSymbol
                      ? AppColors.mainColor
                      : AppColors.fourthColor,
            ),
          ),
          spaceHiresontal16(),
          Container(
            decoration: BoxDecoration(
              color: AppColors.secondColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: playerOne
                ? Row(
                    children: [
                      switchController.oSymbol
                          ? const CircleSymbol(oSymbol: true)
                          : const TextSymbol(oSymbol: true),
                      !switchController.oSymbol
                          ? const CircleSymbol(oSymbol: false)
                          : const TextSymbol(oSymbol: false),
                    ],
                  )
                : Row(
                    children: [
                      !switchController.oSymbol
                          ? const CircleSymbol(oSymbol: true)
                          : const TextSymbol(oSymbol: true),
                      switchController.oSymbol
                          ? const CircleSymbol(oSymbol: false)
                          : const TextSymbol(oSymbol: false),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
