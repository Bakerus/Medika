import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';

import '../../../core/widgets/Dialog.dart';
import '../controllers/drMeet_controller.dart';

class DrMeetDetail extends GetView<DrMeetController> {
  DrMeetDetail({super.key});

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
    // TODO: implement build
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
          Card(
            surfaceTintColor: Colors.white,
            elevation: 2,
            margin: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            child: ListTile(
              leading: SizedBox(
                width: 100,
                child: Image.asset(
                  "assets/images/icons/logo.png",
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
              title: const Text(
                "Doctor Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("speciality"),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const Text("experience"),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(Icons.pin_drop),
                      Text("location"),
                    ],
                  ),
                ],
              ),
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
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniamLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"),
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
                    Get.toNamed("/drmeet/payement");
                  },
                  child: const Text("Suivant")),
            ),
          ),
        ],
      ),
    );
  }
}
