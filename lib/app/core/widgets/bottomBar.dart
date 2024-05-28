import 'package:flutter/cupertino.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:medika/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class BottomAppBarCustomized extends StatelessWidget {
  BottomAppBarCustomized({super.key});

  final HomeController controller = HomeController();
  Widget build(BuildContext context) {
    return Container(
      child: BottomAppBar(
        height: 8.5.hp,
        surfaceTintColor: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.0.wp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () => controller.onItemTapped(0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: controller.selectedIndex == 0
                            ? Appcolors.redPrimary
                            : Colors.white,
                      ),
                      Icon(Icons.home,
                          size: 18.0.sp,
                          color: controller.selectedIndex == 0
                              ? Colors.white
                              : Appcolors.greySmallText)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.onItemTapped(1),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: controller.selectedIndex == 1
                            ? Appcolors.redPrimary
                            : Colors.white,
                      ),
                      Icon(Icons.mail,
                          size: 17.0.sp,
                          color: controller.selectedIndex == 1
                              ? Colors.white
                              : Appcolors.greySmallText)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.onItemTapped(2),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: controller.selectedIndex == 2
                            ? Appcolors.redPrimary
                            : Colors.white,
                      ),
                      Icon(Icons.calendar_month,
                          size: 18.0.sp,
                          color: controller.selectedIndex == 2
                              ? Colors.white
                              : Appcolors.greySmallText)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.onItemTapped(3),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: controller.selectedIndex == 3
                            ? Appcolors.redPrimary
                            : Colors.white,
                      ),
                      Icon(Icons.person_outline,
                          size: 18.0.sp,
                          color: controller.selectedIndex == 3
                              ? Colors.white
                              : Appcolors.greySmallText)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
