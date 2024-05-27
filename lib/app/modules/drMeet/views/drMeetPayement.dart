import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';

import '../../../core/widgets/Dialog.dart';
import '../controllers/drMeet_controller.dart';

class DrMeetPayement extends GetView<DrMeetController> {
  const DrMeetPayement({super.key});

  static const TextStyle textTitle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("DrMeet"),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(children: [
        Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Material(
            surfaceTintColor: Colors.white,
            child: ListTile(
              leading: Image.asset(
                "assets/images/doctor.png",
                width: 30.0.wp,
                height: 40.0.hp,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
              title: const Text(
                "Doctor Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("speciality"),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const Text("experience"),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.pin_drop),
                      Text("location"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Divider(
                thickness: 1,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date de réservation",
                      style: textTitle,
                    ),
                    Text("Modifier")
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 255, 224, 222),
                      ),
                      child: const Icon(
                        Icons.calendar_month,
                        color: Appcolors.redPrimary,
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Mercredi, 23 juin 2021 | 14:00",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("La raison", style: textTitle),
                    Text("Modifier")
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 255, 224, 222),
                      ),
                      child: const Icon(
                        Icons.edit_note,
                        color: Appcolors.redPrimary,
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Douleur thoraxique",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                    width: double.infinity,
                    child: Text("Détails de paiement",
                        textAlign: TextAlign.start, style: textTitle)),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Consultation"), Text("600 FCFA")],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Frais d'administration"), Text("50.0 FCFA")],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Réduction supplémentaire"), Text("-")],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Total"), Text("650.00 FCFA")],
              ),
              const Divider(
                thickness: 1,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                    width: double.infinity,
                    child: Text("Mode de paiement",
                        textAlign: TextAlign.start, style: textTitle)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/icons/om.png",
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                  const Text("+(237) 693 739 871"),
                  const Text("Modifier")
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 90.0.wp,
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const DialogCustomize(
                                  title: 'Réservation réussi', describe: '');
                            });
                      },
                      child: const Text("Réserver")),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
