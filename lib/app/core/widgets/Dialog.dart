import 'package:flutter/material.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/design/themes.dart';
import 'package:medika/app/core/utils/extensions.dart';

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
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 40.0.hp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: Appcolors.redbackgound,
              radius: 40.0,
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
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(buttonName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
