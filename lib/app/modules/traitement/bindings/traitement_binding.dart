import 'package:get/get.dart';

import '../controllers/traitement_controller.dart';

class TraitementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TraitementController>(
      () => TraitementController(),
    );
  }
}
