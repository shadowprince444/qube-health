import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubehealth/app/routes/app_pages.dart';
import 'package:qubehealth/app/utils/screen_utils/size_config.dart';
import 'package:qubehealth/app/utils/theme/app_theme.dart';

import '../controllers/second_screen_controller.dart';

class SecondScreenView extends GetView<SecondScreenController> {
  const SecondScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppTheme.appColors.appPrimaryColorCyan,
          ),
          onPressed: () {
            Get.toNamed(Routes.feelingHistoryScreen, parameters: {"userId": "3206161992"});
          },
          child: Text(
            "Navigate to feeling history screen",
            style: AppTheme.textThemes.headline1,
          ),
        ),
      ),
    );
  }
}
