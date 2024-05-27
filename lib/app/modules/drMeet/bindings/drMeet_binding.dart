import 'package:get/get.dart';

import '../controllers/drMeet_controller.dart';

class DrMEETBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrMeetController>(
      () => DrMeetController(),
    );
  }
}
