import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';

import '../controllers/test_patient_controler.dart';

class PatientTestView extends GetView<PatientTestController> {
  const PatientTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PatientTestController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mes Test',
          style: TextStyle(
              fontFamily: 'Outfit-Bold',
              fontSize: 18.0,
              color: Appcolors.blackPrimary,
              fontWeight: FontWeight.w600),
        ),
        leading: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            iconSize: 40,
            color: Appcolors.redPrimary,
            icon: const Icon(Icons.add_box_rounded),
            onPressed: () {
              controller.showTestDialog(); // Appel de la méthode showTestDialog
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.tests.isEmpty) {
          return Center(
            child: Text(
              'Aucun test enregistré',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.tests.length,
            itemBuilder: (context, index) {
              final test = controller.tests[index];
              return ListTile(
                title: Text(
                  test.title,
                  style: TextStyle(
                      fontFamily: 'Outfit-ExtraBold',
                      color: Appcolors.blackText),
                ),
                subtitle: Text(test.date,
                    style: TextStyle(color: Appcolors.greyText, fontSize: 12)),
                trailing: Text(
                  test.result,
                  style: TextStyle(
                      color:
                          test.result == 'Positif' ? Colors.red : Colors.green,
                      fontSize: 12),
                ),
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
