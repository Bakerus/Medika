import 'package:flutter/material.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/design/themes.dart';
import 'package:medika/app/core/utils/extensions.dart';

class DialogCustomize extends StatelessWidget {
  final String title;
  final String describe;
  const DialogCustomize(
      {super.key, required this.title, required this.describe});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 40.0.hp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromRGBO(245, 248, 255, 1),
              radius: 30.0,
              child: Icon(
                Icons.check,
                color: Appcolors.redPrimary,
                size: 40.0.sp,
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
                        color: Appcolors.blackPrimary),
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
              child: const ElevatedButton(onPressed: null, child: Text("Vers l'accueil")),
            ),
          ],
        ),
      ),
    );
  }
}
