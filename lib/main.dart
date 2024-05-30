import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xo_game/core/utils/app_colors.dart';
import 'package:xo_game/core/utils/app_fonts.dart';
import 'package:xo_game/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xo_game/start_pages/presentation/pages/splash_screen.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  // sharedPreferences.clear();

  if (!sharedPreferences.containsKey("firstLunch")) {
    sharedPreferences.setBool("firstLunch", true);
    sharedPreferences.setString("playerOneSymbol", "o");
    sharedPreferences.setString("playerTwoSymbol", "x");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppFonts.appFontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
