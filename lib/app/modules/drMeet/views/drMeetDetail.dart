import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/widgets/Dialog.dart';
import '../controllers/drMeet_controller.dart';

class DrMeetDetail extends GetView<DrMeetController> {
  DrMeetDetail({super.key});
  DrMeetController drMeetController = DrMeetController();

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
          const Divider(
            thickness: 1,
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
                    controller.selectedTime ==
                                TimeOfDay(hour: 00, minute: 00) &&
                            controller.time.value
                        ? 'Pas de date chosie'
                        : 'Date choisie : ${DateFormat.yMMMMd().format(controller.selectedDate)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    _presentDatePicker(context);
                  },
                  child: const Text("Choissisez une date"))
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
                        : 'Heure choisie : ${controller.selectedTime}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    _presentTimePicker(context);
                  },
                  child: const Text("Choissisez une heure"))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const DialogCustomize(
                            title: 'Bravo Bienvenue',
                            describe:
                                'Vous vous etes connectés avec succés à wesero+');
                      });
                },
                child: const Text("Suivant")),
          ),
        ],
      ),
    );
  }
}
