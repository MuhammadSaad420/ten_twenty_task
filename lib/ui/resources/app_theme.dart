import 'package:court_pro/ui/resources/app_assets.dart';
import 'package:court_pro/ui/resources/app_colors.dart';
import 'package:court_pro/ui/resources/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static ThemeData theme = ThemeData(
    fontFamily: AppFonts.poppins,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    scaffoldBackgroundColor: AppColors.offWhite,
  );
}
