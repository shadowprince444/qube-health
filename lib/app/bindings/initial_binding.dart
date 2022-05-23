import 'package:get/get.dart';
import 'package:qubehealth/app/controllers/internet_connectivity_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternetConnectivityController>(() => InternetConnectivityController());
  }
}
