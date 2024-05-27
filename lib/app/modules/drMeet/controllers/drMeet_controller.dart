import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medika/app/data/providers/doctorProvider.dart';
import 'package:medika/app/modules/drMeet/Models/doctorModel.dart';

class DrMeetController extends GetxController {
  //TODO: Implement OnboradingController
  final doctorProvider = DoctorProvider();

  static List<Doctor> doctors = [];

  DateTime selectedDate = DateTime(2019);
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  final count = 0.obs;
  final RxBool date = RxBool(true);
  final RxBool time = RxBool(true);
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

  void increment() {
    count.value++;
  }

  void DateChanged(DateTime newDate) {
    date.value = false;
    selectedDate = newDate;
    print(selectedDate);
  }

  void TimeChanged(TimeOfDay newTime) {
    time.value = false;
    selectedTime = newTime;
    print(selectedTime);
  }

  void reset() {
    selectedDate = DateTime(2019);
    selectedTime = TimeOfDay(hour: 00, minute: 00);

    count.value = 0;
    date.value = true;
    time.value = true;
  }
}
