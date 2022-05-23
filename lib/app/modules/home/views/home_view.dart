import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubehealth/app/routes/app_pages.dart';
import 'package:qubehealth/app/utils/screen_utils/size_config.dart';
import 'package:qubehealth/app/utils/theme/app_theme.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppTheme.appColors.appPrimaryColorCyan,
            ),
            onPressed: () {
              Get.toNamed(
                Routes.secondScreen,
              );
            },
            child: Text(
              "Navigate to second screen",
              style: AppTheme.textThemes.headline1,
            ),
          ),
        ),
      ),
    );
  }
}
