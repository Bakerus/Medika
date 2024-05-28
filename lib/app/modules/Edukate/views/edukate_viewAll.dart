import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/bottomBar.dart';
import 'package:medika/app/core/widgets/cardEdukate.dart';
import 'package:medika/app/core/widgets/textfield.dart';
import 'package:medika/app/data/models/articles.dart';

class Edukate_ViewAll extends StatelessWidget {
  final Text? title;
  final RxList<Articles> list;
  const Edukate_ViewAll({super.key, required this.title, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const TextfielCustomized(
                  hintext: 'Recherche des articles,...',
                  height: 45.0,
                  inconsPrefixed: Icons.search),
            ),
            SizedBox(
                height: 90.0.hp,
                child: Obx(() {
                  if (list.isEmpty) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Appcolors.redOpacity,
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return CardEdukate(
                          image: list[index].image,
                          title: list[index].titre,
                          date: list[index].date,
                        );
                      },
                    );
                  }
                })),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBarCustomized(),
    );
  }
}
