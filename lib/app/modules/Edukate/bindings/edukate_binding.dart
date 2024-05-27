import 'package:get/get.dart';

import '../controllers/edukate_controller.dart';

class EdukateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EdukateController>(
      () => EdukateController(),
    );
  }
}
