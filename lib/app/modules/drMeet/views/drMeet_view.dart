import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/bottomBar.dart';
import 'package:medika/app/modules/drMeet/widgets/doctorItem.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/textfield.dart';
import '../../../data/providers/doctorProvider.dart';
import '../controllers/drMeet_controller.dart';

class DrMEETtView extends GetView<DrMeetController> {
  DrMEETtView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("DrMeet"),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
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
                          "Bienvenue sur DrMeet",
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
                  'assets/images/icons/drMeetLogoWhite.png',
                  fit: BoxFit.cover,
                  width: 18.0.wp,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: TextfielCustomized(
                hintext: 'Recherche des articles,...',
                height: 45.0,
                inconsPrefixed: Icons.search),
          ),
          Expanded(
              child: ListView(
            children: doctorProvider.doctors
                .map((dr) => Doctoritem(
                      key: ValueKey(dr.id),
                      id: dr.id,
                      name: dr.name,
                      experience: dr.experience,
                      speciality: dr.specialty,
                      location: dr.location,
                      imageUrl: dr.imageUrl,
                    ))
                .toList(),
          )),
        ],
      ),
      bottomNavigationBar: BottomAppBarCustomized(),
    );
  }
}
