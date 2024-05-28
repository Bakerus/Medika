import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/design/themes.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/textfield.dart';
import 'package:medika/app/modules/login/views/login_view.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:phonenumbers/phonenumbers.dart';

import 'signup_professionnel_view_2.dart';

import '../controllers/signup_professionnel_controller.dart';

class SignupProfessionnelView extends GetView<SignupProfessionnelController> {
  const SignupProfessionnelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SignupProfessionnelController controller =
        Get.put(SignupProfessionnelController());
    final phoneNumberController = PhoneNumberEditingController();
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
          height: 80.0.hp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 45.0.hp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      children: [
                        Obx(() {
                          return CircleAvatar(
                            radius: 50,
                            backgroundColor: Appcolors.redbackgound,
                            backgroundImage: controller
                                    .selectedImagePath.value.isEmpty
                                ? null
                                : FileImage(
                                    File(controller.selectedImagePath.value)),
                            child: controller.selectedImagePath.value.isEmpty
                                ? Icon(
                                    Icons.person_outlined,
                                    size: 50,
                                    color: Colors.grey,
                                  )
                                : null,
                          );
                        }),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: controller.pickImage,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Appcolors.redPrimary,
                              child: Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextfielCustomized(
                        hintext: 'Entrez votre nom',
                        inconsPrefixed: Icons.person_2_outlined),
                    TextfielCustomized(
                        hintext: 'Entrez votre email',
                        inconsPrefixed: Icons.email_outlined),
                    PhoneNumberField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          PasswordField(
                            color: Colors.blue,
                            backgroundColor: Appcolors.greyTextfield,
                            passwordConstraint: r'.*[@$#.*].*',
                            hintText: 'Entrez votre mot de passe',
                            border: PasswordBorder(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(55.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue.shade100,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    width: 2, color: Colors.red.shade200),
                              ),
                            ),
                            errorMessage:
                                'Doit contenir des caracteres speciaux . * @ # \$',
                          ),
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
                            Get.to(SignupProfessionnelView2());
                          },
                          child: Text("Suivant")),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(LoginView());
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
