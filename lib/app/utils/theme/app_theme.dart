import 'package:flutter/material.dart';
import 'package:qubehealth/app/utils/screen_utils/size_config.dart';

class AppTheme {
  static _AppColors appColors = _AppColors();
  static _AppTextThemes textThemes = _AppTextThemes(primaryTextColor: appColors.primaryTextColor);
  static _AppShapes appShapes = _AppShapes();

  static double get bottomSheetBorderRadius => appShapes.bottomSheetBorderRadius;

  static double get borderRadius => appShapes.borderRadius;

  static double get dialogBorderRadius => appShapes.dialogBorderRadius;
  static Shadow appLogoTextShadow = const Shadow(color: Colors.black, blurRadius: 4.0, offset: const Offset(0, 4));
}

//region AppColors
class _AppColors {
  //region App Primary Color

  Color appPrimaryColorGreen = const Color(0xFF85C454);
  Color appPrimaryColorViolet = const Color(0xFF4F4F4F);
  Color appPrimaryColorCyan = const Color(0xFFC6E5F7);
  Color appPrimaryColorWhite = const Color(0xFFFFFFFF);
  Color appPrimaryBackground = const Color(0xFFF2F2F2);

  //endregion

  //region Text Colors
  Color primaryTextColor = const Color(0xFF000000);
  Color secondaryTextColor = const Color(0xFF121212);
  Color blurredGreySubtitleTextColor = const Color(0xFFA7A7A7);
  Color blurredGrayTitleTextColor = const Color(0xFFF1F2F3);
// $endregion

}
//endregion

//region Text Themes
class _AppTextThemes {
  static const String _fontFamily = "Cairo";
  late TextStyle _textStyle;

  ///Commonly used text style in the app.

  late TextStyle subtitle1 = _textStyle.copyWith(fontSize: 10.sp(), fontWeight: FontWeight.normal);
  late TextStyle subtitle2 = _textStyle.copyWith(fontSize: 12.sp(), fontWeight: FontWeight.normal);
  late TextStyle bodyText1 = _textStyle.copyWith(fontSize: 14.sp(), fontWeight: FontWeight.normal);
  late TextStyle bodyText2 = _textStyle.copyWith(fontSize: 15.sp(), fontWeight: FontWeight.w200);
  late TextStyle headline1 = _textStyle.copyWith(fontSize: 16.sp(), fontWeight: FontWeight.bold);
  late TextStyle headline2 = _textStyle.copyWith(fontSize: 18.sp(), fontWeight: FontWeight.bold);
  late TextStyle headline3 = _textStyle.copyWith(fontSize: 20.sp(), fontWeight: FontWeight.bold);

  Color primaryTextColor;

  _AppTextThemes({required this.primaryTextColor}) {
    _textStyle = TextStyle(fontFamily: _fontFamily, color: this.primaryTextColor);
  }
}
//endregion

//region App backgrounds
class _AppShapes {
  static const double _borderRadius = 8;
  static const double _dialogBorderRadius = 16, _bottomSheetRadius = 16;

  double get dialogBorderRadius => _dialogBorderRadius;

  double get bottomSheetBorderRadius => _bottomSheetRadius.vdp();

  double get borderRadius => _borderRadius;
  RoundedRectangleBorder bottomSheetBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(
        _bottomSheetRadius.vdp(),
      ),
      topRight: Radius.circular(
        _bottomSheetRadius.vdp(),
      ),
    ),
  );
  RoundedRectangleBorder cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(_borderRadius),
  );
  BoxShadow cardShadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    blurRadius: 20,
    offset: const Offset(0, -5),
    spreadRadius: 0,
  );
}
//endregion
