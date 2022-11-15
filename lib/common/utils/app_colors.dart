import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _instance = AppColors._instance;

  factory AppColors() {
    return AppColors();
  }
  AppColors.internal();

  static Color textBlack = const Color(0xFF000000);
  static Color textWhite = const Color(0xFFFFFFFF);
  static Color loginDesc = const Color(0xFF7C7C7C);
  static Color forgetPassText = const Color(0xFFFF0000);
  static Color borderColor = const Color(0xFFEFEFEF);
  static Color stackcanvas = const Color(0xFFFCFAFA);
  static Color green = const Color(0xFF95EE24);
  static Color starColor = const Color(0xFFFFF500);
}
