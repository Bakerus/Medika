import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/design/themes.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/Dialog.dart';
import 'package:medika/app/core/widgets/textfield.dart';
import '../controllers/signup_patient_controller.dart';

class SignupPatientView extends GetView<SignupPatientController> {
  const SignupPatientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupPatientController controller =
        Get.put(SignupPatientController());

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
          height: 60.0.hp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 30.0.hp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextfielCustomized(
                        hintext: 'Entrez votre nom',
                        inconsPrefixed: Icons.person_2_outlined),
                    TextfielCustomized(
                        hintext: 'Entrez votre email',
                        inconsPrefixed: Icons.email_outlined),
                    SizedBox(
                      child: Column(
                        children: [
                          TextfielCustomized(
                            hintext: 'Entrez votre mot de passe',
                            inconsPrefixed: Icons.lock_outline,
                            inconsSuffixed: Icons.remove_red_eye_outlined,
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
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DialogCustomize(
                                    title: 'Inscription reussie!',
                                    describe:
                                        'Vous serez notifié de la validation de \n  votre compte sur WeSero+',
                                    buttonName: 'Se connecter',
                                  );
                                });
                          },
                          child: Text("Se connecter")),
                    ),
                    Text(
                      "Avez-vous un compte? Connectez-vous",
                      style: AppTheme.lightTheme.textTheme.bodySmall,
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
