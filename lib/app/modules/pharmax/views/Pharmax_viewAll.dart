import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/bottomBar.dart';
import 'package:medika/app/core/widgets/cardPharmax.dart';
import 'package:medika/app/core/widgets/textfield.dart';
import 'package:medika/app/modules/pharmax/controllers/pharmax_controller.dart';
import 'package:medika/app/modules/pharmax/views/Pharmax_viewDetails.dart';

class PharmaXAll extends GetView<PharmaxController> {
  const PharmaXAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
            onPressed: null,
            icon: Icon(Icons.arrow_back_ios_new_rounded,
                color: Appcolors.blackText)),
        title: const Text('Tous les medicaments'),
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.more_vert,
                color: Appcolors.blackText,
              ))
        ],
      ),
      body: SizedBox(
        height: 100.0.hp,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const TextfielCustomized(
                  hintext: 'Recherche des articles,...',
                  height: 45.0,
                  inconsPrefixed: Icons.search),
            ),
            SizedBox(
              height: 70.0.hp,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(PharmaX_viewDetails());
                                      },
                                      child: CardPharmax(
                                        image: "assets/images/Soue.jpg",
                                        title: "Nom du médicament",
                                        date: "Grammage",
                                      ),
                                    ),
                                    CardPharmax(
                                      image: "assets/images/Soue.jpg",
                                      title: "Nom du médicament",
                                      date: "Grammage",
                                    ),
                                    CardPharmax(
                                      image: "assets/images/Soue.jpg",
                                      title: "Nom du médicament",
                                      date: "Grammage",
                                    ),
                                    CardPharmax(
                                      image: "assets/images/Soue.jpg",
                                      title: "Nom du médicament",
                                      date: "Grammage",
                                    ),
                                    CardPharmax(
                                      image: "assets/images/Soue.jpg",
                                      title: "Nom du médicament",
                                      date: "Grammage",
                                    ),
                                    CardPharmax(
                                      image: "assets/images/Soue.jpg",
                                      title: "Nom du médicament",
                                      date: "Grammage",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBarCustomized(),
    );
  }
}
