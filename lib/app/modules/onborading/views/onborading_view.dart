import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onborading_controller.dart';

class OnboradingView extends GetView<OnboradingController> {
  const OnboradingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnboradingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OnboradingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
