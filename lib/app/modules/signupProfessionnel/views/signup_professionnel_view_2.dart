import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/design/themes.dart';
import 'package:medika/app/core/utils/extensions.dart';

import 'package:medika/app/modules/DossierMedical/Views/dossier_medical_view.dart';

import '../controllers/signup_professionnel_controller.dart';
import '../../../core/widgets/date_picker_button.dart.dart';
import '../../../core/widgets/file_picker.dart';
import 'package:medika/app/core/widgets/Dialog.dart';

class SignupProfessionnelView2 extends GetView<SignupProfessionnelController> {
  const SignupProfessionnelView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupProfessionnelController controller =
        Get.put(SignupProfessionnelController());
    TextEditingController dateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inscription',
          style: TextStyle(
              fontFamily: 'Outfit-Bold',
              fontSize: 18.0,
              color: Appcolors.blackPrimary,
              fontWeight: FontWeight.w600),
        ),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: SizedBox(
          height: 85.0.hp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 60.0.hp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      children: [],
                    ),
                    Obx(() => DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Quel est votre genre',
                            prefixIcon: Icon(Icons.male_outlined),
                          ),
                          value: controller.selectedGender.value.isEmpty
                              ? null
                              : controller.selectedGender.value,
                          items:
                              ['Homme', 'Femme', 'Autre'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: controller.changeGender,
                        )),
                    Obx(() {
                      return GestureDetector(
                        onTap: () => controller.selectCountry(context),
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Appcolors.greyTextfield,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.flag_outlined,
                                  color: Appcolors.greyPrimary),
                              SizedBox(width: 10),
                              Text(
                                controller.selectedCountry.value.isEmpty
                                    ? 'Sélectionnez votre pays'
                                    : controller.selectedCountry.value,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    Obx(() => DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Entrez votre qualification',
                            prefixIcon: Icon(Icons.work_outline_outlined),
                          ),
                          value: controller.selectedQualif.value.isEmpty
                              ? null
                              : controller.selectedQualif.value,
                          items: ['Infectiologue', 'Gynecologue']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: controller.changeQualif,
                        )),
                    Obx(() => DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Entrez votre ville de résidence',
                            prefixIcon: Icon(Icons.location_city_outlined),
                          ),
                          value: controller.selectedCity.value.isEmpty
                              ? null
                              : controller.selectedCity.value,
                          items:
                              ['Sangmelima', 'Bafoussam'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: controller.changeCity,
                        )),
                    SizedBox(
                      child: Column(
                        children: [
                          DatePickerButton(
                            hintText: 'Date de début de carrières',
                            icon: Icons.calendar_today_outlined,
                            controller: dateController,
                          ),
                          FilePicker(
                              hintText: 'Chargez votre diplôme',
                              prefixIcon: Icons.school_outlined,
                              suffixIcon: Icons.attach_file_outlined),
                          FilePicker(
                              hintText: 'Chargez votre CNI ',
                              prefixIcon: Icons.perm_identity_outlined,
                              suffixIcon: Icons.attach_file_outlined),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Obx(() {
                                  return IconButton(
                                    icon: Icon(controller.isChecked.value
                                        ? Icons.check_box
                                        : Icons
                                            .check_box_outline_blank_outlined),
                                    onPressed: controller.toggleCheckbox,
                                  );
                                }),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  '  J’accepte les conditions d’utilisation et la politique \n de confidentialité de WeSero+',
                                  style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontSize: 14.0,
                                      color: Appcolors.blackPrimary,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0.hp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 65,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(55))),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DialogCustomize(
                                    title: 'Bravo!',
                                    describe:
                                        'Votre compte a bien été enregistré',
                                    buttonName: 'Se connecter',
                                  );
                                });
                          },
                          child: Text("Se connecter")),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(DossierMedicalView());
                      },
                      child: Text(
                        "Avez-vous un compte? Connectez-vous",
                        style:
                            AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                          color: Colors
                              .blue, // Changez la couleur du texte si nécessaire
                          decoration: TextDecoration
                              .underline, // Ajoutez un soulignement
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
