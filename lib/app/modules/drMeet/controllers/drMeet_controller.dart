import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medika/app/modules/drMeet/Models/doctorModel.dart';

class DrMeetController extends GetxController {
  //TODO: Implement OnboradingController
  static List<Doctor> doctors = [
    Doctor(
        id: "1",
        name: "Dr Ze ALida",
        specialty: 'Psycologue',
        experience: 'an(s) d\'experience',
        location: 'yaoundé, Cameroun'),
    Doctor(
        id: "2",
        name: "Nkolo Thomas",
        specialty: 'Surgeon',
        experience: '6 an(s) d\'experience',
        location: 'Sangmelima, Cameroun'),
    Doctor(
        id: "3",
        name: "ANYABA Steve",
        specialty: 'Therapist',
        experience: '6 an(s) d\'experience',
        location: 'Garoua, Cameroun'),
  ];

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
}
