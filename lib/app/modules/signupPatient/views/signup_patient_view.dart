import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_patient_controller.dart';

class SignupPatientView extends GetView<SignupPatientController> {
  const SignupPatientView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupPatientView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SignupPatientView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
