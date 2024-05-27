import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';

class CardCustomized extends StatelessWidget {
  final String moduleName;
  final String moduleImage;
  final Widget page;
  const CardCustomized(
      {super.key, required this.page, required this.moduleImage, required this.moduleName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12.0.hp,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              height: 12.0.hp,
              width: 19.0.wp,
              child: Column(
                children: [
                  SizedBox(
                    height: 8.5.hp,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(page);
                      },
                      child: Card(
                        elevation: 1.0,
                        surfaceTintColor: Colors.white,
                        child: Center(
                          child: Image.asset(
                            moduleImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    moduleName,
                    style: TextStyle(
                        color: Appcolors.blackPrimary,
                        fontSize: 14,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
