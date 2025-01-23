part of '../app_theme.dart';

class AppColors {
  static final AppColors _instance = AppColors._internal();

  factory AppColors() => _instance;

  AppColors._internal();

  Color appPrimary = const Color(0xFF3E7B27);
  Color appSecondary = const Color(0xFF85A947);
  Color appTertiary = const Color(0xFFEFE3C2);
  Color appQuaternary = const Color(0xff123524);
  Color appGrey = const Color(0xD6D6D7CE);
  Color appAlert = const Color(0xFFDC2222);
  Color appSuccess = const Color(0xFF00B383);
  Color appWarning = const Color(0xFFFEC260);
  Color appBlackGrey = const Color(0xFF2F2F2F);
  Color appBlack = const Color(0xFF040404);
  Color white = Colors.white;
  Color transparent = Colors.transparent;

  void updatePrimaryColor(Color primaryColor) {
    appPrimary = primaryColor;
  }
}
