import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medika/app/core/widgets/bottomBar.dart';
import 'package:medika/app/modules/traitement/views/ajouter_traitemet.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/treatmentProvider.dart';
import '../controllers/traitement_controller.dart';

class TraitementASuivreView extends GetView<TraitementController> {
  const TraitementASuivreView({super.key});

  Widget newTreatment(
      {required String title,
      required String doctor,
      required String dosage,
      required BuildContext ctx}) {
    return SizedBox(
      height: 100,
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 3,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    doctor,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    dosage,
                    style: TextStyle(
                        color: Theme.of(ctx).colorScheme.onPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TraitementController());
    final treatmentProvider = Provider.of<TreatmentProvider>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Traitement à suivre"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => AjouterTraitementView());
              },
              icon: Icon(
                Icons.add_box_rounded,
                color: Theme.of(context).colorScheme.onPrimary,
              ))
        ],
      ),
      body: Obx(() =>
          controller.count.value >= 0 && treatmentProvider.treatments.isNotEmpty
              ? ListView(
                  children: treatmentProvider.treatments
                      .map((tr) => newTreatment(
                          title: tr.title,
                          doctor: tr.doctor,
                          dosage: tr.dosage,
                          ctx: context))
                      .toList(),
                )
              : const Center(
                  child: Text("No treatment yet"),
                )),
      bottomNavigationBar: BottomAppBarCustomized(),
    );
  }
}
