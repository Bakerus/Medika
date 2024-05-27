import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medika/app/modules/traitement/views/ajouter_traitemet.dart';

import '../controllers/traitement_controller.dart';

class TraitementASuivreView extends GetView<TraitementController> {
  const TraitementASuivreView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Traitement à suivre"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const AjouterTraitementView());
                },
                icon: Icon(
                  Icons.add_box_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                ))
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 100,
              child: Card(
                color: const Color.fromARGB(255, 223, 223, 223),
                elevation: 3,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        width: double.infinity,
                        child: Text(
                          "Traitement maux de tête",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Dr Mederos"),
                          Text(
                            "Matin | midi | soir",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ],
        ));
  }
}
