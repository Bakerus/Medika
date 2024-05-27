import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/traitement_controller.dart';

class TraitementView extends GetView<TraitementController> {
  const TraitementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TraitementView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TraitementView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
