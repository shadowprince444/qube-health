import 'package:get/get.dart';

import '../modules/feeling_history_screen/bindings/feelings_history_screen_binding.dart';
import '../modules/feeling_history_screen/views/feeling_history_screen.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/second_screen/bindings/second_screen_binding.dart';
import '../modules/second_screen/views/second_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.feelingHistoryScreen,
      page: () => FeelingHistoryScreenView(),
      binding: FeelingsHistoryScreenBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.secondScreen,
      page: () => SecondScreenView(),
      binding: SecondScreenBinding(),
    ),
  ];
}
