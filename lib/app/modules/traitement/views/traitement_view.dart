import 'package:flutter/material.dart';

import 'package:get/get.dart';
import './traitement_à_suivre.dart';

import '../controllers/traitement_controller.dart';

class TraitementView extends GetView<TraitementController> {
  const TraitementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TraitementView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bienvenue sur Therapy",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "Suivez votre traitement, faites des tests et enregistrez les pour votre suivi",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/icons/therapyLogoWhite.png",
                    height: 100,
                    width: 100,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(children: [
                SizedBox(
                  height: 100,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const TraitementASuivreView());
                    },
                    child: Card(
                      elevation: 3,
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            "assets/images/icons/logo.png",
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        const Text("Traitement à suivre"),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Card(
                    elevation: 3,
                    child: Row(children: [
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: Icon(
                            Icons.add,
                            size: 50,
                            color: Theme.of(context).colorScheme.primary,
                          )),
                      const Text("Enregistrer mes tests"),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Card(
                    elevation: 3,
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(
                          "assets/images/icons/logo.png",
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      const Text("Tous mes rendez-vous"),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Card(
                    elevation: 3,
                    child: Row(children: [
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: Icon(
                            Icons.file_copy,
                            size: 50,
                            color: Theme.of(context).colorScheme.primary,
                          )),
                      const Text("Dossier médicaux"),
                    ]),
                  ),
                ),
              ]),
            ),
          ],
        ));
  }
}
