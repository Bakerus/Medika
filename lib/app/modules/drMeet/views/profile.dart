import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/drMeet_controller.dart';

class Profile extends GetView<DrMeetController> {
  const Profile({required this.appBarTitle, super.key});

  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
      child: Text("Profile Works"),
    );
  }
}
