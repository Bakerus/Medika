import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';

class Doctoritem extends StatelessWidget {
  const Doctoritem(
      {super.key,
      required this.id,
      required this.name,
      required this.speciality,
      required this.experience,
      required this.location,
      required this.imageUrl});

  final int id;
  final String name;
  final String speciality;
  final String experience;
  final String location;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/drmeet/detail', arguments: id);
      },
      child: SizedBox(
        height: 18.0.hp,
        child: Card(
          elevation: 5,
          surfaceTintColor: Colors.white,
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.network(
                imageUrl,
                height: 100,
                fit: BoxFit.fitHeight,
                alignment: Alignment.topCenter,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Outfit',
                    color: Appcolors.blackText,
                  ),
                ),
                Text(
                  speciality,
                  style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 12,
                      color: Appcolors.greySmallText),
                ),
                SizedBox(
                  height: 9.0.hp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          Text(
                            experience,
                            style: TextStyle(
                                color: Appcolors.redPrimary,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: Appcolors.greySmallText,
                            size: 18.0.sp,
                          ),
                          Text(
                            location,
                            style: TextStyle(
                                color: Appcolors.greySmallText,
                                fontSize: 12,
                                fontFamily: 'Outfit'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
