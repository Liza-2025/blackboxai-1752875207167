import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF0A73B7);
  static const secondary = Color(0xFF0D5F8B);
  static const background = Colors.white;
  static const error = Colors.red;
  static const success = Colors.green;
  static const lightGrey = Color(0xFFF5F5F5);
  static const darkGrey = Color(0xFF666666);
  static const textPrimary = Color(0xFF333333);
  static const textSecondary = Color(0xFF666666);
}

class AppTextStyles {
  static const headline1 = TextStyle(
    fontSize: 28, 
    fontWeight: FontWeight.bold, 
    color: AppColors.textPrimary
  );
  
  static const headline2 = TextStyle(
    fontSize: 24, 
    fontWeight: FontWeight.bold, 
    color: AppColors.textPrimary
  );
  
  static const headline3 = TextStyle(
    fontSize: 20, 
    fontWeight: FontWeight.w600, 
    color: AppColors.textPrimary
  );
  
  static const bodyText1 = TextStyle(
    fontSize: 16, 
    color: AppColors.textPrimary
  );
  
  static const bodyText2 = TextStyle(
    fontSize: 14, 
    color: AppColors.textSecondary
  );
  
  static const button = TextStyle(
    fontSize: 16, 
    fontWeight: FontWeight.w600, 
    color: Colors.white
  );
}

class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}
