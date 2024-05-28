import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/design/themes.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/core/widgets/bottomBar.dart';
import 'package:medika/app/core/widgets/cardMedecins.dart';
import 'package:medika/app/core/widgets/cardModule.dart';
import 'package:medika/app/core/widgets/othersModules.dart';
import 'package:medika/app/core/widgets/textfield.dart';
import 'package:medika/app/modules/Edukate/views/edukate_view.dart';
import 'package:medika/app/modules/drMeet/views/drMeet_view.dart';
import 'package:medika/app/modules/pharmax/views/pharmax_viewPrincipal.dart';
import 'package:medika/app/modules/traitement/views/traitement_view.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/doctorProvider.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardCustomized(
                      moduleName: 'DrMeet',
                      moduleImage: "assets/icons/Doctor.png",
                      page: DrMEETtView(),
                    ),
                    const CardCustomized(
                        moduleName: 'Pharmax',
                        moduleImage: "assets/icons/Pharmacy.png",
                        page: PharmaXPrincipal()),
                    const CardCustomized(
                      moduleName: 'Therapy',
                      moduleImage: "assets/icons/Hospital.png",
                      page: TraitementView(),
                    ),
                    const CardCustomized(
                      moduleName: 'Care+',
                      moduleImage: "assets/icons/Care.png",
                      page: EdukateView(),
                    ),
                  ],
                ),
                const OthersModules(
                  desription:
                      "Informez vous sur les \n maladies autour de vous",
                  image: 'assets/images/Group.png',
                  backgroundColor: Appcolors.redOpacity,
                  bouttonColor: Appcolors.redPrimary,
                  textbutton: 'Acceder à Edukate',
                  colorText: Appcolors.blackPrimary,
                  page: EdukateView(),
                ),
                OthersModules(
                  desription: "Des médecins prêts à vous\n suivre à distance",
                  image: 'assets/images/Frame.png',
                  backgroundColor: Appcolors.redPrimary,
                  bouttonColor: Appcolors.redSecondary,
                  textbutton: 'Acceder à DrMeet',
                  colorText: Colors.white,
                  page: DrMEETtView(),
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
                    GestureDetector(
                      onTap: () {
                        Get.to(DrMEETtView());
                      },
                      child: Text(
                        "Tout voir",
                        style: AppTheme.lightTheme.textTheme.labelMedium!
                            .copyWith(color: Appcolors.redPrimary),
                      ),
                    ),
                  ],
                ),
                doctorProvider.doctors.isEmpty
                    ? FutureBuilder(
                        future: doctorProvider.fetchDoctors(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            // Access the fetched data
                            // Use 'data' in your widget logic
                            return SizedBox(
                              height: 180,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: doctorProvider.doctors
                                    .map((dr) => GestureDetector(
                                          onTap: () {
                                            Get.toNamed("/drmeet/detail",
                                                arguments: dr.id);
                                          },
                                          child: CardCustomizedMedecins(
                                            key: ValueKey(dr.id),
                                            image: dr.imageUrl,
                                            doctorName: dr.name,
                                            doctorSpeciality: dr.specialty,
                                            localisation: dr.location,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ); // Example: Display the fetched data
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(
                                    'Error: ${snapshot.error}')); // Show error message
                          } else {
                            return const Center(
                                child:
                                    CircularProgressIndicator()); // Show loading indicator
                          }
                        },
                      )
                    : SizedBox(
                        height: 180,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: doctorProvider.doctors
                              .map((dr) => GestureDetector(
                                    onTap: () {
                                      Get.toNamed("/drmeet/detail",
                                          arguments: dr.id);
                                    },
                                    child: CardCustomizedMedecins(
                                      key: ValueKey(dr.id),
                                      image: dr.imageUrl,
                                      doctorName: dr.name,
                                      doctorSpeciality: dr.specialty,
                                      localisation: dr.location,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBarCustomized(),
    );
  }
}
