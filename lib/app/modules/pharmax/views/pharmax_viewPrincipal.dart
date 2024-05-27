import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/modules/pharmax/controllers/pharmax_controller.dart';

class PharmaXPrincipal extends GetView<PharmaxController> {
  const PharmaXPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
            onPressed: null,
            icon: Icon(Icons.arrow_back_ios_new_rounded,
                color: Appcolors.blackText)),
        title: const Text('PharmaX'),
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.more_vert,
                color: Appcolors.blackText,
              ))
        ],
      ),
      body: Center(),
    );
  }
}
