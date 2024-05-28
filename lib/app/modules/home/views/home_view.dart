import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/design/themes.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/cardMedecins.dart';
import 'package:medika/app/core/widgets/cardModule.dart';
import 'package:medika/app/core/widgets/othersModules.dart';
import 'package:medika/app/core/widgets/textfield.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Touvez votre \n solution de santé',
          style: AppTheme.lightTheme.textTheme.titleLarge,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.notifications_outlined,
              size: 25.0.sp,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: 100.0.hp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         Text(
                //           'Touvez votre \n solution de santé',
                //           style: AppTheme.lightTheme.textTheme.titleLarge,
                //         ),
                //       ],
                //     ),
                //     Icon(
                //       Icons.notifications_outlined,
                //       size: 30.0.sp,
                //     ),
                //   ],
                // ),
                const TextfielCustomized(
                    hintext: 'Recherche de médecin, medicaments, articles,...',
                    inconsPrefixed: Icons.search),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardCustomized(
                        moduleName: 'DrMeet',
                        moduleImage: "assets/icons/Doctor.png"),
                    CardCustomized(
                      moduleName: 'Pharmax',
                      moduleImage: "assets/icons/Pharmacy.png",
                    ),
                    CardCustomized(
                      moduleName: 'hospital',
                      moduleImage: "assets/icons/Hospital.png",
                    ),
                    CardCustomized(
                      moduleName: 'Care+',
                      moduleImage: "assets/icons/Care.png",
                    ),
                  ],
                ),
                const OthersModules(
                  desription:
                      "Informez-vous sur les \n maladies autour de vous",
                  image: 'assets/images/Group.png',
                  backgroundColor: Appcolors.redbackgound,
                  bouttonColor: Appcolors.redPrimary,
                  textbutton: 'Acceder à Edukate',
                  colorText: Appcolors.blackPrimary,
                ),
                const OthersModules(
                  desription: "Des médecins prêts à vous\n suivre à distance",
                  image: 'assets/images/Frame.png',
                  backgroundColor: Appcolors.redPrimary,
                  bouttonColor: Appcolors.redSecondary,
                  textbutton: 'Acceder à DrMet',
                  colorText: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Professionnel pour vous",
                      style: TextStyle(
                          color: Appcolors.blackPrimary,
                          fontFamily: 'Outfit',
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Tout voir",
                      style: AppTheme.lightTheme.textTheme.labelMedium!
                          .copyWith(color: Appcolors.redPrimary),
                    ),
                  ],
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CardCustomizedMedecins(
                        image: "assets/images/Soue.jpg",
                        doctorName: 'Dr Habib Hamaro',
                        doctorSpeciality: "Infectiologue",
                        localisation: "Washington , USA",
                      ),
                      CardCustomizedMedecins(
                        image: "assets/images/Soue.jpg",
                        doctorName: 'Dr Habib Hamaro',
                        doctorSpeciality: "Infectiologue",
                        localisation: "Washington , USA",
                      ),
                      CardCustomizedMedecins(
                        image: "assets/images/Soue.jpg",
                        doctorName: 'Dr Habib Hamaro',
                        doctorSpeciality: "Infectiologue",
                        localisation: "Washington , USA",
                      ),
                      CardCustomizedMedecins(
                        image: "assets/images/Soue.jpg",
                        doctorName: 'Dr Habib Hamaro',
                        doctorSpeciality: "Infectiologue",
                        localisation: "Washington , USA",
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 7.5.hp,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Obx(
          () => Row(
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
    );
  }
}
