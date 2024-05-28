import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/design/themes.dart';
import 'package:medika/app/core/utils/extensions.dart';
import 'package:medika/app/modules/home/views/home_view.dart';

class DialogCustomize extends StatelessWidget {
  final String title;
  final String describe;
  final String buttonName;

  const DialogCustomize({
    Key? key,
    required this.title,
    required this.describe,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      content: SizedBox(
        height: 40.0.hp,
        width: 80.0.wp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromRGBO(245, 248, 255, 1),
              radius: 30.0.sp,
              child: Icon(
                Icons.check,
                color: Appcolors.redPrimary,
                size: 35.0.sp,
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                      color: Appcolors.blackPrimary,
                    ),
                  ),
                  Text(
                    describe,
                    textAlign: TextAlign.center,
                    style: AppTheme.lightTheme.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 45.0.wp,
              height: 50,
              child: const ElevatedButton(
                  onPressed: null, child: Text("Vers l'accueil")),
            ),
          ],
        ),
      ),
    );
  }
}
