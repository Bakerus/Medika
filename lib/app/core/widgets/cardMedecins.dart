import 'package:flutter/material.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/design/themes.dart';
import 'package:medika/app/core/utils/extensions.dart';

class CardCustomizedMedecins extends StatelessWidget {
  final String image;
  final String doctorName;
  final String doctorSpeciality;
  final String localisation;
  const CardCustomizedMedecins({super.key, required this.image, required this.doctorName, required this.doctorSpeciality, required this.localisation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: 25.0.hp,
      width: 35.0.wp,
      child: Card(
        surfaceTintColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 42,
                backgroundImage: AssetImage(image)),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: AppTheme.lightTheme.textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Appcolors.blueSmallText),
                  ),
                  Text(
                    doctorSpeciality,
                    style: AppTheme.lightTheme.textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.place,
                  color: Appcolors.redPrimary,
                ),
                Text(localisation ,
                    style: AppTheme.lightTheme.textTheme.labelSmall!.copyWith(
                        color: Appcolors.redPrimary,
                        fontSize: 8,
                        fontWeight: FontWeight.w600))
              ],
            )
          ],
        ),
      ),
    );
  }
}
