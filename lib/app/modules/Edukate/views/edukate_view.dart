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

import '../controllers/edukate_controller.dart';

class EdukateView extends GetView<EdukateController> {
  const EdukateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                            Text(
                              "Tout voir",
                              style: AppTheme.lightTheme.textTheme.labelMedium!
                                  .copyWith(color: Appcolors.redPrimary),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.0.hp,
                          child: Column(
                            children: [
                              CardEdukate(
                                image: "assets/images/Soue.jpg",
                                title:
                                    "Le paludisme en Afrique : Tout ce qu’il faut \n savoir sur la maladie",
                                date: "Le 10 juin 2021 + Dr. Evans",
                              ),
                              CardEdukate(
                                image: "assets/images/Soue.jpg",
                                title:
                                    "Le paludisme en Afrique : Tout ce qu’il faut \n savoir sur la maladie",
                                date: "Le 10 juin 2021 + Dr. Evans",
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Articles sur la santés",
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
                          child: CardEdukate(
                            image: "assets/images/Soue.jpg",
                            title:
                                "Le paludisme en Afrique : Tout ce qu’il faut \n savoir sur la maladie",
                            date: "Le 10 juin 2021 + Dr. Evans",
                          ),
                        ),
                        CardEdukate(
                          image: "assets/images/Soue.jpg",
                          title:
                              "Le paludisme en Afrique : Tout ce qu’il faut \n savoir sur la maladie",
                          date: "Le 10 juin 2021 + Dr. Evans",
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
