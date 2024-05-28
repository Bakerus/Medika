import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:medika/app/core/widgets/document_dialog.dart';

class Document {
  final String title;
  final String date;

  Document({required this.title, required this.date});
}

class DossierMedicalController extends GetxController {
  final documents = <Document>[].obs;
  final selectedFileName = ''.obs;

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      selectedFileName.value = result.files.single.name;
    }
  }

  void addDocument(Document document) {
    documents.add(document);
  }

  void deleteDocument(Document document) {
    documents.remove(document);
  }

  void showDocumentDialog() {
    Get.dialog(DocumentDialog(
      title: 'Enregistrer un document',
    ));
  }

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

  final count = 0.obs;
  final selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
