import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qubehealth/app/controllers/internet_connectivity_controller.dart';
import 'package:qubehealth/app/utils/enums/general_enums.dart';
import 'package:qubehealth/app/utils/screen_utils/size_config.dart';
import 'package:qubehealth/app/utils/screen_utils/widgets/responsive_safe_area.dart';
import 'package:qubehealth/app/utils/theme/text_themes.dart';

class AppCustomScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Color statusBarColor;
  final Color? backgroundColor;
  final Widget? bottomSheet;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInsets;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget body;

  const AppCustomScaffold({
    Key? key,
    required this.body,
    this.drawer,
    this.scaffoldKey,
    this.statusBarColor = const Color(0xFFE12026),
    this.backgroundColor,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomSheet,
    this.resizeToAvoidBottomInsets = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final networkController = Get.find<InternetConnectivityController>();
    return buildScaffold(networkController);
  }

  buildScaffold(InternetConnectivityController networkController) {
    return Obx(() {
      // Color statusBarTempColor = networkController.internetConnectionStatus.value == ConnectionStatusEnum.internetConnectionAvailable
      //     ? statusBarColor
      //     : Colors.transparent.withOpacity(
      //         .25,
      //       );
      return IgnorePointer(
        ignoring: networkController.isLoading.value || networkController.internetConnectionStatus.value != ConnectionStatusEnum.internetConnectionAvailable,
        child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: resizeToAvoidBottomInsets,
            bottomSheet: bottomSheet,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            backgroundColor: backgroundColor ?? const Color(0xffF2F2F2),
            drawer: drawer,
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: statusBarColor,
              ),
              child: ResponsiveSafeArea(builder: (context, size) {
                return Stack(
                  children: [
                    body,
                    Obx(() {
                      return Visibility(
                        visible: networkController.isLoading.value,
                        child: ColoredBox(
                          color: Colors.transparent,
                          child: SizedBox(
                              height: size.height,
                              width: size.width,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              )),
                        ),
                      );
                    }),
                    Obx(() {
                      return Visibility(
                        visible: networkController.internetConnectionStatus.value != ConnectionStatusEnum.internetConnectionAvailable,
                        child: ColoredBox(
                          color: Colors.transparent.withOpacity(.25),
                          child: SizedBox(
                            height: size.height,
                            width: size.width,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.hdp(),
                                    vertical: 8.vdp(),
                                  ),
                                  width: size.width,
                                  color: Colors.grey,
                                  child: Center(
                                    child: Text(
                                      "No Internet Connection...!",
                                      style: AppTextThemes().headline2,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "Please check your internet connection",
                                      style: AppTextThemes().headline3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                );
              }),
            )),
      );
    });
  }

// Scaffold buildNoInternetScreen() {
//   return const Scaffold(
//     body: Center(
//       child: Text(
//         "No Internet Connection available.please check you're connection.!",
//         style: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ),
//   );
// }
}
