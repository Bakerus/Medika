import 'package:get/get.dart';

class OnboradingController extends GetxController {
  //TODO: Implement OnboradingController
  static const List onBoardItems = [
    {
      "imagePath": "assets/images/onBoard1.png",
      "description": "WeSero+ vous aide à maintenir un mode de vie sain"
    },
    {
      "imagePath": "assets/images/onBoard2.png",
      "description": "Nous vous aidons à trouver vos médicaments"
    },
    {
      "imagePath": "assets/images/onBoard3.png",
      "description": "Des médecins disponibles pour votre suivi en ligne"
    },
    {
      "imagePath": "assets/images/onBoard4.png",
      "description": "Nous vous aidons à retracer votre historique médical"
    },
    {
      "imagePath": "assets/images/onBoard5.png",
      "description":
          "Vous pouvez aussi accéder à divers autres services de santé"
    },
    {
      "imagePath": "assets/images/onBoard6.png",
      "description": "Nous vous tenons informé sur les maladies autour de vous"
    },
  ];

  final count = 0.obs;
  final RxBool changeView = RxBool(true);
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

  void increment() {
    if (count.value < onBoardItems.length - 1) {
      count.value++;
      print(count.value);
    } else {
      changeView.value = false;
    }
  }

  void seConnecter() {
    Get.offAndToNamed("/login");
  }
}
