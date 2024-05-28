import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/Dialog.dart';
import 'package:medika/app/core/widgets/date_picker_button.dart.dart';
import 'package:medika/app/modules/patientTest/controllers/test_patient_controler.dart';

class TestDialog extends StatelessWidget {
  final String title;
  final String describe;

  const TestDialog({
    Key? key,
    required this.title,
    required this.describe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PatientTestController toggleController =
        Get.put(PatientTestController());

    TextEditingController dateController = TextEditingController();

    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 45.0.hp,
        width: 60.0.hp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.assignment_add,
                  color: Appcolors.redPrimary,
                ),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Outfit-Bold',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                    color: Appcolors.blackPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 60), // Increased space between title and content
            // Content section with reduced spacing
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Date de test',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                    height: 10), // Reduced height between title and content
                SizedBox(
                  width: 20.0.hp,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DatePickerButton(
                          hintText: 'Entrez la date',
                          icon: Icons.calendar_today_outlined,
                          controller: dateController,
                        ),
                      ]),
                ),
                SizedBox(height: 35), // Space between sections
                Text(
                  'Résultat',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4), // Reduced height between title and content
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(toggleController.isToggled.value
                            ? 'Négatif'
                            : 'Positif'),
                        SizedBox(width: 15), // Space between text and switch
                        Switch(
                          value: toggleController.isToggled.value,
                          onChanged: (value) {
                            toggleController.toggle();
                          },
                          activeColor: Colors.green,
                          inactiveThumbColor: Colors.red,
                          inactiveTrackColor: Colors.red.shade200,
                        ),
                      ],
                    )),
              ],
            ),
            SizedBox(height: 60), // Space before button
            // Button section
            SizedBox(
              width: double.infinity,
              height: 65,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55))),
                onPressed: () {
                  toggleController.addTest(Test(
                    title: 'HIV/AIDS Test',
                    date: dateController.text,
                    result: toggleController.isToggled.value
                        ? 'Négatif'
                        : 'Positif',
                  ));
                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const DialogCustomize(
                          title: 'Test enregistre!',
                          describe: '',
                          buttonName: 'OK',
                        );
                      });
                },
                child: Text("Enregistrer le test"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
