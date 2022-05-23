import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:qubehealth/app/utils/screen_utils/size_config.dart';
import 'package:qubehealth/app/utils/theme/app_theme.dart';

buildSnackBar(String message, String title) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: true,
    margin: EdgeInsets.symmetric(
      vertical: SizeConfig.getBottomScreenPadding() + 80.vdp(),
      horizontal: 24.hdp(),
    ),
    backgroundColor: AppTheme.appColors.appPrimaryColorGreen.withOpacity(.42),
  );
}
