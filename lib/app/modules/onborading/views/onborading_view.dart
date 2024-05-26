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
        body: Obx(
          () => controller.changeView.value
              ? LayoutBuilder(
                  builder: (context, constraints) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: constraints.maxHeight,
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          const Positioned(
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Passer',
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            child: Obx(
                              () => Image.asset(
                                OnboradingController
                                        .onBoardItems[controller.count.value]
                                    ['imagePath']!,
                                width: constraints.maxWidth * 0.9,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 185,
                              width: constraints.maxWidth * 0.9,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 40),
                                child: Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 60),
                                    child: Text(
                                      OnboradingController.onBoardItems[
                                              controller.count.value]
                                          ['description']!,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            child: SizedBox(
                              width: constraints.maxWidth,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 90,
                                    child: Obx(
                                      () => LinearProgressIndicator(
                                        value: controller.count.value * 0.2,
                                        borderRadius: BorderRadius.circular(20),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                    ),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () => {controller.increment()},
                                    backgroundColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    shape: const CircleBorder(eccentricity: 0),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    "assets/images/icons/logo.png",
                    height: 150,
                    width: 150,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "WeSero+",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                    ),
                  ),
                  const Text(
                    "Découvrez notre Appli!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30, left: 50, right: 50),
                    child: Text(
                      "Inscrivez-vous pour profiter de toutes les fonctionnalités, et gardez la forme !",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.seConnecter();
                    },
                    child: const Text("Se connecter"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100, top: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Inscription"),
                    ),
                  )
                ]),
        ));
  }
}
