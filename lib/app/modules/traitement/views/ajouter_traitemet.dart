import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/bottomBar.dart';
import 'package:provider/provider.dart';

import '../../../core/design/colors.dart';
import '../../../core/widgets/Dialog.dart';
import '../../../data/providers/treatmentProvider.dart';
import '../controllers/traitement_controller.dart';

class AjouterTraitementView extends GetView<TraitementController> {
  AjouterTraitementView({Key? key}) : super(key: key);

  final _titleTreat = TextEditingController();
  final _doctorTreat = TextEditingController();
  final _medcineTreat = TextEditingController();
  final _dosageTreat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final treatmentProvider = Provider.of<TreatmentProvider>(context);

    void onAddClicked() {
      treatmentProvider.addToTreatments(_titleTreat.text, _doctorTreat.text,
          _medcineTreat.text, _dosageTreat.text);
      controller.increment();
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Traitement à suivre"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _titleTreat,
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide.none),
                    fillColor: Appcolors.greyTextfield,
                    hintText: "Titre du traitement"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _doctorTreat,
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide.none),
                    fillColor: Appcolors.greyTextfield,
                    hintText: "Nom du medecin traitant"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      "Info de prise",
                      style: TextStyle(backgroundColor: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _medcineTreat,
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide.none),
                    fillColor: Appcolors.greyTextfield,
                    hintText: "Nom du medicament"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _dosageTreat,
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide.none),
                    fillColor: Appcolors.greyTextfield,
                    hintText: "Dosage"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Matin"),
                      DropdownButton(
                          items: <String>[
                            'Item 1',
                            'Item 2',
                            'Item 3'
                          ] // List of dropdown items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {})
                    ],
                  ),
                  Column(
                    children: [
                      Text("Midi"),
                      DropdownButton(
                          items: <String>[
                            'Item 1',
                            'Item 2',
                            'Item 3'
                          ] // List of dropdown items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {})
                    ],
                  ),
                  Column(
                    children: [
                      Text("Soir"),
                      DropdownButton(
                          items: <String>[
                            'Item 1',
                            'Item 2',
                            'Item 3'
                          ] // List of dropdown items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {})
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Période",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.red.shade100,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        Text("Mer, 23/12/2023")
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.red.shade100,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month,
                            color: Theme.of(context).colorScheme.onPrimary),
                        Text("Mer, 23/12/2023")
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 100.0.wp,
                child: ElevatedButton(
                    onPressed: () {
                      onAddClicked();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const DialogCustomize(
                                title: 'Bravo',
                              describe: 'Votre traitement a bin été ajouté',
                              buttonName: 'ok',
                            );
                          });
                    },
                    child: const Text("Enregistrer le traitement")),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBarCustomized(),
    );
  }
}
