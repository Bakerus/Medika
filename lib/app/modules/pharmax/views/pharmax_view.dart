import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medika/app/core/widgets/textfield.dart';
import '../controllers/pharmax_controller.dart';

class PharmaxView extends GetView<PharmaxController> {
  const PharmaxView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
      body: Stack(children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: controller.cameraPosition.value,
          onMapCreated: (GoogleMapController googleMapController) {
            controller.mapController.value.complete(googleMapController);
          },
        ),
        Container(
          margin: EdgeInsets.all(8),
          child: const TextfielCustomized(
              height: 50.0,
              hintext: 'Search pharmacie...',
              inconsPrefixed: Icons.search),
        ),
      ]),
    );
  }
}
