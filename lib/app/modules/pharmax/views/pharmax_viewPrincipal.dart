import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/design/themes.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/bottomBar.dart';
import 'package:medika/app/core/widgets/cardEdukate.dart';
import 'package:medika/app/core/widgets/cardPharmax.dart';
import 'package:medika/app/core/widgets/cardPharmaxPharmacie.dart';
import 'package:medika/app/core/widgets/textfield.dart';
import 'package:medika/app/modules/pharmax/controllers/pharmax_controller.dart';
import 'package:medika/app/modules/pharmax/views/Pharmax_viewall.dart';

class PharmaXPrincipal extends GetView<PharmaxController> {
  const PharmaXPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PharmaxController controller = Get.put(PharmaxController());
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
            onPressed: null,
            icon: Icon(Icons.arrow_back_ios_new_rounded,
                color: Appcolors.blackText)),
        title: const Text('PharmaX'),
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.more_vert,
                color: Appcolors.blackText,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Appcolors.redPrimary,
                  borderRadius: BorderRadius.circular(8.0)),
              height: 15.0.hp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Bienvenue sur Pharmax",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Outfit',
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Recherchez vos médicaments de \n traitement anti-rétroviraux",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.71),
                                fontFamily: 'Outfit',
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/icons/pharmax.png',
                    fit: BoxFit.cover,
                    width: 22.0.wp,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const TextfielCustomized(
                        hintext: 'Recherche des articles,...',
                        height: 45.0,
                        inconsPrefixed: Icons.search),
                  ),
                  SizedBox(
                    height: 62.0.hp,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Médicaments courants",
                              style: TextStyle(
                                  color: Appcolors.blackPrimary,
                                  fontFamily: 'Outfit',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(PharmaXAll());
                              },
                              child: Text(
                                "Tout voir",
                                style: AppTheme
                                    .lightTheme.textTheme.labelMedium!
                                    .copyWith(color: Appcolors.redPrimary),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.0.hp,
                          child: Obx(() {
                            if (controller.medicamentsLists.isEmpty) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Appcolors.redOpacity,
                                ),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  print(
                                      "${controller.medicamentsLists[index].imageUrl}");
                                  return CardPharmax(
                                    image: controller
                                        .medicamentsLists[index].imageUrl,
                                    title:
                                        controller.medicamentsLists[index].nom,
                                    date: controller
                                        .medicamentsLists[index].grammage,
                                    prix:
                                        controller.medicamentsLists[index].prix,
                                  );
                                },
                              );
                            }
                          }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Pharmacies",
                              style: TextStyle(
                                  color: Appcolors.blackPrimary,
                                  fontFamily: 'Outfit',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Tout voir",
                              style: AppTheme.lightTheme.textTheme.labelMedium!
                                  .copyWith(color: Appcolors.redPrimary),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.0.hp,
                          child: Obx(() {
                            if (controller.pharmacieLists.isEmpty) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Appcolors.redOpacity,
                                ),
                              );
                            } else {
                              return ListView.builder(
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return CardPharmaxPharmacie(
                                    title: controller.pharmacieLists[index].nom,
                                    date:
                                        controller.pharmacieLists[index].quartier,
                                  );
                                },
                              );
                            }
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBarCustomized(),
    );
  }
}
