import 'package:get/get.dart';

import '../controllers/signup_professionnel_controller.dart';

class SignupProfessionnelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupProfessionnelController>(
      () => SignupProfessionnelController(),
    );
  }
}
