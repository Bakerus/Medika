import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/Dialog.dart';
import 'package:medika/app/core/widgets/file_picker.dart';
import 'package:medika/app/core/widgets/textfield.dart';
import 'package:medika/app/modules/DossierMedical/controllers/dossier_medical_controller.dart';

class DocumentDialog extends StatelessWidget {
  final String title;

  const DocumentDialog({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DossierMedicalController controller =
        Get.put(DossierMedicalController());

    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 45.0.hp,
        width: 60.0.hp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.document_scanner_rounded,
                  color: Appcolors.redPrimary,
                ),
                SizedBox(width: 8),
                Text(
                  'Enregistrer un document',
                  style: TextStyle(
                    fontFamily: 'Outfit-Bold',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                    color: Appcolors.blackPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextfielCustomized(
                  hintext: 'Entrez le titre du document',
                  inconsPrefixed: Icons.abc_outlined,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Divider()),
                    Text('Joindre'),
                    Expanded(child: Divider())
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            FilePicker(
              hintText: 'Joindre un document',
              prefixIcon: Icons.document_scanner_outlined,
              suffixIcon: Icons.attach_file_outlined,
            ),
            SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              height: 65,
              child: Obx(
                () => controller.selectedFileName.value.isEmpty
                    ? InkWell(
                        onTap: () {
                          controller.pickFile();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Appcolors.redPrimary,
                            borderRadius: BorderRadius.circular(55),
                          ),
                          child: Center(
                            child: Text(
                              'Choisir un fichier',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Outfit',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(55),
                          ),
                        ),
                        onPressed: () {
                          controller.addDocument(Document(
                            title: controller.selectedFileName.value,
                            date: DateTime.now().toString(),
                          ));
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DialogCustomize(
                                title: 'Dossier importé!',
                                describe: '',
                                buttonName: 'OK',
                              );
                            },
                          );
                        },
                        child: Text("Enregistrer le document"),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
