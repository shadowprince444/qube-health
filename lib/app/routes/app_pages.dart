import 'package:get/get.dart';

import '../modules/homescreen/bindings/homescreen_binding.dart';
import '../modules/homescreen/views/homescreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOMESCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOMESCREEN,
      page: () => HomeScreenView(),
      binding: HomescreenBinding(),
    ),
  ];
}
