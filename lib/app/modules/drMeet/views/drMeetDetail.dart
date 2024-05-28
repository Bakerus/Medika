import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/modules/drMeet/Models/doctorModel.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/doctorProvider.dart';
import '../controllers/drMeet_controller.dart';

class DrMeetDetail extends GetView<DrMeetController> {
  DrMeetDetail({super.key});

  final doctorProvider = DoctorProvider();

  final int drId = Get.arguments as int;

  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      initialDate: DateTime.now(),
    ).then((pickedDate) {
      controller.DateChanged(pickedDate!);
    });
  }

  void _presentTimePicker(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((pickedTime) {
      controller.TimeChanged(pickedTime!);
    });
  }

  @override
  Widget build(BuildContext context) {
    controller.reset();
    // TODO: implement build
    final doctorProvider = Provider.of<DoctorProvider>(context);
    final Doctor doctor =
        doctorProvider.doctors.firstWhere((doc) => doc.id == drId);
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
          SizedBox(
            height: 18.0.hp,
            child: Card(
              elevation: 5,
              surfaceTintColor: Colors.white,
              margin: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8,
              ),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(
                    doctor.imageUrl,
                    height: 100,
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      doctor.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Outfit',
                        color: Appcolors.blackText,
                      ),
                    ),
                    Text(
                      doctor.specialty,
                      style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 12,
                          color: Appcolors.greySmallText),
                    ),
                    SizedBox(
                      height: 9.0.hp,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              Text(
                                doctor.experience,
                                style: TextStyle(
                                    color: Appcolors.redPrimary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_sharp,
                                color: Appcolors.greySmallText,
                                size: 18.0.sp,
                              ),
                              Text(
                                doctor.location,
                                style: TextStyle(
                                    color: Appcolors.greySmallText,
                                    fontSize: 12,
                                    fontFamily: 'Outfit'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "About",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(doctor.about
                    //"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniamLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"
                    ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Programer un rendez-vous",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: Obx(
                  () => Text(
                    controller.selectedDate == DateTime(2019) &&
                            controller.date.value
                        ? 'Pas de date chosie'
                        : 'Date : ${DateFormat.yMMMMd().format(controller.selectedDate)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _presentDatePicker(context);
                  },
                  icon: const Icon(Icons.calendar_month,
                      color: Appcolors.redPrimary)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: Obx(
                  () => Text(
                    controller.selectedTime ==
                                TimeOfDay(hour: 00, minute: 00) &&
                            controller.time.value
                        ? 'Pas d\'heure choisie'
                        : 'Heure : ${controller.selectedTime.hour} : ${controller.selectedTime.minute} ',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _presentTimePicker(context);
                  },
                  icon: Icon(
                    Icons.alarm,
                    color: Appcolors.redPrimary,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width: 90.0.wp,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/drmeet/payement", arguments: doctor.id);
                  },
                  child: const Text("Suivant")),
            ),
          ),
        ],
      ),
    );
  }
}
