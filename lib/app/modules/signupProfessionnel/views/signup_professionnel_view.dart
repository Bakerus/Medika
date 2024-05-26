import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_professionnel_controller.dart';

class SignupProfessionnelView extends GetView<SignupProfessionnelController> {
  const SignupProfessionnelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupProfessionnelView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SignupProfessionnelView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
