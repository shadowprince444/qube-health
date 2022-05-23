import 'package:get/get.dart';

import '../controllers/feelings_history_screen_controller.dart';

class FeelingsHistoryScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeelingHistoryScreenViewController>(
      () => FeelingHistoryScreenViewController(),
    );
  }
}
