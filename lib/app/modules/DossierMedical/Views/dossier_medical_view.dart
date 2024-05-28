import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/modules/DossierMedical/controllers/dossier_medical_controller.dart';

class DossierMedicalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DossierMedicalController controller =
        Get.put(DossierMedicalController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mes dossiers médicaux',
          style: TextStyle(
            fontFamily: 'Outfit-Bold',
            fontSize: 18.0,
            color: Appcolors.blackPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            iconSize: 40,
            color: Appcolors.redPrimary,
            icon: const Icon(Icons.add_box_rounded),
            onPressed: () {
              controller
                  .showDocumentDialog(); // Appel de la méthode showTestDialog
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.documents.isEmpty) {
          return Center(
            child: Text(
              'Aucun document enregistré',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.documents.length,
            itemBuilder: (context, index) {
              final document = controller.documents[index];
              return ListTile(
                title: Text(document.title),
                subtitle: Text(document.date),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.download_rounded),
                      onPressed: () {
                        // Logic to download the document
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        controller.deleteDocument(document);
                      },
                    ),
                  ],
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
