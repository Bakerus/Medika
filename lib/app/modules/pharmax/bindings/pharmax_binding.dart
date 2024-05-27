import 'package:get/get.dart';

import '../controllers/pharmax_controller.dart';

class PharmaxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PharmaxController>(
      () => PharmaxController(),
    );
  }
}
