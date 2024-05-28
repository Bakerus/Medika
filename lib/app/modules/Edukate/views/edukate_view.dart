import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/design/themes.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/bottomBar.dart';
import 'package:medika/app/core/widgets/cardEdukate.dart';
import 'package:medika/app/core/widgets/textfield.dart';
import 'package:medika/app/data/models/articles.dart';
import 'package:medika/app/modules/Edukate/views/edukate_viewAll.dart';

import '../controllers/edukate_controller.dart';

class EdukateView extends GetView<EdukateController> {
  final controller = Get.put(EdukateController());
  var selecteList;

  EdukateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final EdukateController controller = Get.put(EdukateController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edukate'),
        leading: const IconButton(
          onPressed: null,
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              color: Appcolors.blackText),
        ),
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(Icons.more_vert, color: Appcolors.blackText))
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Bienvenue sur Edukate",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Outfit',
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Informez-vous sur les maladies autour \n de vous",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Outfit',
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/Group_2.png',
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
                              "Les maladies autour de vous",
                              style: TextStyle(
                                  color: Appcolors.blackPrimary,
                                  fontFamily: 'Outfit',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            GestureDetector(
                              onTap: () {
                                 Get.to(Edukate_ViewAll(
                                  title: Text(
                                    "Articles sur la santé",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  list: controller.articleListsGeneral,
                                ));
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
                              if (controller.articleListsGeneral.isEmpty) {
                                return const Center(
                                     child: CircularProgressIndicator(
                                  color: Appcolors.redOpacity,
                                ));
                              } else {
                                return ListView.builder(
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return CardEdukate(
                                      image: controller
                                          .articleListsGeneral[index].image,
                                      title: controller
                                          .articleListsGeneral[index].titre,
                                      date: controller
                                          .articleListsGeneral[index].date,
                                    );
                                  },
                                );
                              }
                            })),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Articles sur la santé",
                              style: TextStyle(
                                  color: Appcolors.blackPrimary,
                                  fontFamily: 'Outfit',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(Edukate_ViewAll(
                                  title: Text(
                                    "Les maladies autour de vous",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  list: controller.articleListsVIH,
                                ));
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
                            height: 12.0.hp,
                            child: Obx(() {
                              if (controller.articleListsVIH.isEmpty) {
                                return Center(
                                    child: CircularProgressIndicator(
                                  color: Appcolors.redOpacity,
                                ));
                              } else {
                                return ListView.builder(
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return CardEdukate(
                                      image: controller
                                          .articleListsVIH[index].image,
                                      title: controller
                                          .articleListsVIH[index].titre,
                                      date: controller
                                          .articleListsVIH[index].date,
                                    );
                                  },
                                );
                              }
                            })),
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
