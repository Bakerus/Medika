import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PharmaxController extends GetxController {
  final cameraPosition = const CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746)
      .obs;
  final mapController = Completer<GoogleMapController>().obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
}
