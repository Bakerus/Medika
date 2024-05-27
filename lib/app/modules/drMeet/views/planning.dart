import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/drMeet_controller.dart';

class Planning extends GetView<DrMeetController> {
  const Planning({required this.appBarTitle, super.key});

  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
      child: Text("Planning Works"),
    );
  }
}
