import 'package:get/get.dart';
import 'package:paygo_sdk_example/presentation/views/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
      permanent: false,
    );
  }
}
