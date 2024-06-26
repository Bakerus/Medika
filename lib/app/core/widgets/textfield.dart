import 'package:flutter/material.dart';
import 'package:medika/app/core/design/colors.dart';

class TextfielCustomized extends StatelessWidget {
  final String hintext;
  final IconData inconsPrefixed;
  final IconData? inconsSuffixed;
  final double height;
  const TextfielCustomized(
      {super.key,
      required this.hintext,
      required this.inconsPrefixed,
      this.height = 60.0,
      this.inconsSuffixed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(color: Appcolors.blackPrimary),
        cursorColor: Appcolors.blackPrimary,
        decoration: InputDecoration(
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide.none),
            fillColor: Appcolors.greyTextfield,
            prefixIcon: Icon(
              inconsPrefixed,
              color: Appcolors.greyPrimary,
              size: 22.0,
            ),
            suffixIcon: Icon(
              inconsSuffixed,
              color: Appcolors.greyPrimary,
              size: 22.0,
            ),
            contentPadding: EdgeInsets.zero,
            hintText: hintext,
            hintStyle: const TextStyle(
                color: Appcolors.greyPrimary,
                fontFamily: 'Outfit',
                fontSize: 16,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
