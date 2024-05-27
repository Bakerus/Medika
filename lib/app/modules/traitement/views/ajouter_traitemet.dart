import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/bottomBar.dart';

import '../../../core/design/colors.dart';
import '../controllers/traitement_controller.dart';

class AjouterTraitementView extends GetView<TraitementController> {
  const AjouterTraitementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Traitement à suivre"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
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
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_box_rounded,
                  size: 30,
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide.none),
                    fillColor: Appcolors.greyTextfield,
                    hintText: "Nom du medecin"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
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
                    onPressed: () {},
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
