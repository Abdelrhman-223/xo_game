/*
**********Project Name: xo_game
**********File Name: user_icon
**********Created At: 30-May-24 5:14 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xo_game/start_pages/presentation/widgets/circle_symbol.dart';

import '../utils/app_colors.dart';
import '../utils/app_icons.dart';
import '../utils/app_images.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({
    super.key,
    required this.size,
    required this.color,
    required this.icon,
    this.backgroundColor,
    this.withSymbol = false,
    this.oSymbol = true,
  });

  final double size;
  final Color? color, backgroundColor;
  final String icon;
  final bool withSymbol, oSymbol;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -1),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.secondColor,
          borderRadius: BorderRadius.circular(size / 2),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                ImagePaths.profileCover,
                height: size,
                width: size,
                color: color,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                icon,
                width: size * 0.25,
                color: color,
              ),
            ),
            if(withSymbol) Align(
              alignment: Alignment.bottomRight,
              child: CircleSymbol(oSymbol: oSymbol)
            ),
          ],
        ),
      ),
    );
  }
}
