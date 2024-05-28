import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:get/get.dart';
import 'package:medika/app/core/widgets/document_dialog.dart';

import 'package:medika/app/core/widgets/test_dialog.dart';

class Test {
  final String title;
  final String date;
  final String result;

  Test({required this.title, required this.date, required this.result});
}

class PatientTestController extends GetxController {
  final tests = <Test>[].obs;
  final isToggled = false.obs;

  void toggle() {
    isToggled.value = !isToggled.value;
  }

  void addTest(Test test) {
    tests.add(test);
  }

  void showTestDialog() {
    Get.dialog(TestDialog(
      title: 'HIV/AIDS Test',
      describe: 'Description du test',
    ));
  }

  void showDocumentDialog() {
    Get.dialog(DocumentDialog(
      title: 'Enregistrer un document',
    ));
  }

  final count = 0.obs;
  final selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
