import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/design/themes.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/Dialog.dart';
import 'package:medika/app/core/widgets/textfield.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Se connecter'),
          leading: const Icon(Icons.arrow_back_ios),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            height: 60.0.hp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Icon(
                  Icons.person,
                  size: 90.0.sp,
                  color: Appcolors.redPrimary,
                ),
                SizedBox(
                  height: 25.0.hp,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround ,
                    children: [
                      TextfielCustomized(
                          hintext: 'Entrez votre email',
                          inconsPrefixed: Icons.email_outlined),
                      SizedBox(
                        child: Column(
                          children: [
                            TextfielCustomized(
                              hintext: 'Entrez votre mot de pasee',
                              inconsPrefixed: Icons.lock_outline,
                              inconsSuffixed: Icons.remove_red_eye,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top:5.0),
                                  child: Text(
                                    'Mot de passe oublié',
                                    style: TextStyle(
                                        fontFamily: 'Outfit',
                                        fontSize: 14.0,
                                        color: Appcolors.redPrimary,
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
                          height: 55,
                          child: ElevatedButton(
                              onPressed: (){
                                showDialog(
                                  context: context,
                                  builder:(BuildContext context){
                                    return DialogCustomize(title: 'Bravo Bienvenue', describe: 'Vous vous etes connectés avec succés à wesero+');
                                  }
                                );
                              }, child: Text("Connexion")),
                        ),
                        Text(
                          "Pas de compte ?, S'inscrire",
                          style: AppTheme.lightTheme.textTheme.bodySmall,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
