import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medika/app/modules/drMeet/widgets/doctorItem.dart';

import '../../../core/widgets/textfield.dart';
import '../controllers/drMeet_controller.dart';

class DrMEETtView extends GetView<DrMeetController> {
  const DrMEETtView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bienvenue sur DrMeet",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "Retrouves des professionels présents sur notre plateforme",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/icons/drMeetLogoWhite.png",
                    height: 100,
                    width: 100,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextfielCustomized(
                  hintext: 'Recherchez des professionels pour vous',
                  inconsPrefixed: Icons.search),
            ),
            Expanded(
              child: ListView(
                children: DrMeetController.doctors
                    .map((dr) => Doctoritem(
                          key: ValueKey(dr.id),
                          name: dr.name,
                          experience: dr.experience,
                          speciality: dr.specialty,
                          location: dr.location,
                        ))
                    .toList(),
              ),
            ),
          ],
        ));
  }
}
