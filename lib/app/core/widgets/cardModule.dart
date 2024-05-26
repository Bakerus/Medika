import 'package:flutter/material.dart';
import 'package:medika/app/core/design/colors.dart';
import 'package:medika/app/core/utils/extensions.dart';

class CardCustomized extends StatelessWidget {
  final String moduleName;
  final String moduleImage;
  const CardCustomized(
      {super.key, required this.moduleImage, required this.moduleName});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: Card(
                      elevation: 1.0,
                      color: Colors.white,
                      child: Center(
                        child: Image.asset(
                          moduleImage,
                          fit: BoxFit.cover,
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
