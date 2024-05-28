import 'package:country_picker/country_picker.dart' as country;
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:phonenumbers/phonenumbers.dart';

class SignupProfessionnelController extends GetxController {
  final selectedGender = ''.obs;
  final selectedCountry = ''.obs;
  final selectedCity = ''.obs;
  final selectedQualif = ''.obs;

  final isChecked = false.obs;
  final selectedFileName = ''.obs;
  final selectedImagePath = ''.obs;

  final phoneNumberController = PhoneNumberEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose(); // to save environment
    super.dispose();
  }

  void changeGender(String? value) {
    selectedGender.value = value ?? '';
  }

  void changeQualif(String? value) {
    selectedQualif.value = value ?? '';
  }

  void selectCountry(BuildContext context) {
    country.showCountryPicker(
      context: context,
      showPhoneCode:
          false, // optional. Shows phone code before the country name.
      onSelect: (country.Country country) {
        selectedCountry.value = country.name;
      },
    );
  }

  void changeCity(String? value) {
    selectedCity.value = value ?? '';
  }

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      selectedFileName.value = result.files.single.name;
    }
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar('Error', 'No image selected');
    }
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
}
