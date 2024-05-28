import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medika/app/data/models/medicaments.dart';
import 'package:medika/app/data/models/pharmacies.dart';
import 'package:medika/app/data/services/medicamentsProvider.dart';
import 'package:medika/app/data/services/pharmarciesProvider.dart';

import 'package:location/location.dart';

class PharmaxController extends GetxController {
  final medicamentsLists = <Medicaments>[].obs;
  List<Pharmacies> pharmacieLists = <Pharmacies>[].obs;

  final MedicamentsProvider medicamentsProvider = MedicamentsProvider();
  final PharmaciesProvider pharmacieProvider = PharmaciesProvider();
  

  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    final medicaments = await medicamentsProvider.get_all_medicaments();
    medicamentsLists.assignAll(medicaments);

    final pharmacie = await pharmacieProvider.get_all_pharmacie();
    pharmacieLists.assignAll(pharmacie);

    getPosition();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  // __________________________________________________________________________________________________________

  final globalMarker = <Marker>{}.obs;
  final cameraPosition = const CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746)
      .obs;
  final stateCurrentLocation = false.obs;
  final depotGazLocation = false.obs;
  final depotGazLocationByBrand = false.obs;
  final idVendeur = 0.obs;
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  final mapController = Completer<GoogleMapController>().obs;
  // final bottlesList = RxList<BottleLot>();

  // LocationData? locationData;
  // VendorsProvider vendorsProvider = VendorsProvider();
  // List<Vendors> vendorsLists = <Vendors>[].obs;
  // var brandList = <Brand>[].obs;
  // var isLoading = true.obs;
  // var selectedBrand = "".obs;
  // int timeTablelist = 0;

  void customIcon(
      {required bool statut,
      required double width,
      required double height,
      required String assetName,
      required RxSet<Marker> marker,
      required int markerId,
      required double latitude,
      required double longitude,
      required String name,
      required String number,
      required String place,
      required String openDate,
      required String openHours}) {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(
                devicePixelRatio: 0.9, size: Size(width, height)),
            assetName)
        .then((icon) {
      marker.add(Marker(
        markerId: MarkerId(markerId.toString()),
        infoWindow: InfoWindow.noText,
        position: LatLng(latitude, longitude),
        icon: icon,
        onTap: () async {
          if (statut == false) {
            // Get.bottomSheet(
            //     BottomSheetGen(
            //       name: name,
            //       number: number,
            //       place: place,
            //       openDate: openDate,
            //       openHours: openHours,
            //     ),
            //     backgroundColor: Colors.transparent,
            //     isScrollControlled: true,
            //     barrierColor: const Color.fromRGBO(0, 0, 0, 0.58));
            // bottlesList.clear();
            // idVendeur.value = markerId;
            // bottlesList.value =
            //     await vendorsProvider.getBottleLot(id: markerId);
          }
        },
      ));
    });
  }

  Future<void> getPosition() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    location.getLocation().then(
      (currentLocation) {
        stateCurrentLocation.value = true;
        latitude.value = currentLocation.latitude!;
        longitude.value = currentLocation.longitude!;

        cameraPosition.value = CameraPosition(
          target: LatLng(latitude.value, longitude.value),
          zoom: 15.5,
        );

        customIcon(
            statut: true,
            width: 20,
            height: 20,
            assetName: "assets/images/userPosition.png",
            marker: globalMarker,
            markerId: 0,
            latitude: currentLocation.latitude!,
            longitude: currentLocation.longitude!,
            name: '',
            number: '',
            place: '',
            openDate: '',
            openHours: '');
      },
    );
  }



  // depotGazByBrandDisplaying(String selectedBrand) async {
  //   if (selectedBrand != "") {
  //     pharmacieLists = await pharmacieProvider.get_all_pharmacie();
  //     depotGazLocation.value = false;
  //     if (depotGazLocationByBrand.value == true) {
  //       depotGazLocationByBrand.value = false;
  //     }
  //     depotGazLocationByBrand.value = true;
  //   } else {
  //     pharmacieLists = await pharmacieProvider.get_all_pharmacie();
  //     depotGazLocation.value = true;
  //   }

  //   for (var pharmacie in pharmacieLists) {
  //     //  timeTablelist = pharmacie.timeTables!.timeTables.length;
  //     customIcon(
  //       statut: false,
  //       width: 34,
  //       height: 34,
  //       assetName: "assets/icons/Pharmacy.png",
  //       marker: globalMarker,
  //       markerId: pharmacie.id,
  //       latitude: vendor.localisation!.latitude,
  //       longitude: vendor.localisation!.longitude,
  //       name: vendor.name,
  //       number: vendor.phone,
  //       place: vendor.address,
  //       openDate: '',
  //       openHours: '',
  //     );
  //   }
  // }


}
