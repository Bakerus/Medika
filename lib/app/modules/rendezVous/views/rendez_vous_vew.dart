import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/modules/patientTest/controllers/test_patient_controler.dart';

class RendezVousView extends GetView<PatientTestController> {
  const RendezVousView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PatientTestController());

    final PatientTestController toggleController =
        Get.put(PatientTestController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tous mes rendez-vous',
          style: TextStyle(
              fontFamily: 'Outfit-Bold',
              fontSize: 18.0,
              color: Appcolors.blackPrimary,
              fontWeight: FontWeight.w600),
        ),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Obx(() {
        if (controller.tests.isEmpty) {
          return Center(
            child: Text(
              'Aucun rendez-vous, veuillez contacter \n un medecin pour et prenez rendez-vous',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Appcolors.greyText),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.tests.length,
            itemBuilder: (context, index) {
              final test = controller.tests[index];
              return ListTile(
                title: Text(
                  'Douleurs thoraciques',
                  style: TextStyle(
                      fontFamily: 'Outfit-ExtraBold',
                      color: Appcolors.blackText),
                ),
                subtitle: Column(children: <Widget>[
                  Text(test.date,
                      style:
                          TextStyle(color: Appcolors.greyText, fontSize: 12)),
                  Text('heure',
                      style: TextStyle(
                          color: Appcolors.blueSmallText,
                          fontSize: 12,
                          backgroundColor: Appcolors.greyPrimary)),
                ]),
                trailing: Column(children: <Widget>[
                  Text(
                    test.date,
                    style: TextStyle(color: Appcolors.redPrimary, fontSize: 14),
                  ),
                  Text(toggleController.isToggled.value ? 'Non-pris' : 'Pris'),
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
                ]),
              );
            },
          );
        }
      }),
      bottomNavigationBar: BottomAppBar(
        height: 7.5.hp,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () => controller.onItemTapped(0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: controller.selectedIndex == 0
                          ? Appcolors.redPrimary
                          : Colors.white,
                    ),
                    Icon(Icons.home,
                        color: controller.selectedIndex == 0
                            ? Colors.white
                            : Appcolors.greySmallText)
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => controller.onItemTapped(1),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: controller.selectedIndex == 1
                          ? Appcolors.redPrimary
                          : Colors.white,
                    ),
                    Icon(Icons.mail,
                        color: controller.selectedIndex == 1
                            ? Colors.white
                            : Appcolors.greySmallText)
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => controller.onItemTapped(2),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: controller.selectedIndex == 2
                          ? Appcolors.redPrimary
                          : Colors.white,
                    ),
                    Icon(Icons.calendar_month,
                        color: controller.selectedIndex == 2
                            ? Colors.white
                            : Appcolors.greySmallText)
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => controller.onItemTapped(3),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: controller.selectedIndex == 3
                          ? Appcolors.redPrimary
                          : Colors.white,
                    ),
                    Icon(Icons.person_outline,
                        color: controller.selectedIndex == 3
                            ? Colors.white
                            : Appcolors.greySmallText)
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
