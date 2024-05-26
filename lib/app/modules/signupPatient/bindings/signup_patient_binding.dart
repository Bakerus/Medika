import 'package:get/get.dart';

import '../controllers/signup_patient_controller.dart';

class SignupPatientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupPatientController>(
      () => SignupPatientController(),
    );
  }
}
