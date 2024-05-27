import 'package:flutter/material.dart';
import 'package:medika/app/core/design/colors.dart';

class TextfielCustomized extends StatelessWidget {
  final String hintext;
  final IconData inconsPrefixed;
  final IconData? inconsSuffixed;
  final double height;
  final Widget? child;

  const TextfielCustomized({
    super.key,
    required this.hintext,
    required this.inconsPrefixed,
    this.height = 60.0,
    this.inconsSuffixed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: child ??
          TextField(
            style: const TextStyle(color: Appcolors.blackPrimary),
            cursorColor: Appcolors.blackPrimary,
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide.none,
              ),
              fillColor: Appcolors.greyTextfield,
              prefixIcon: Icon(
                inconsPrefixed,
                color: Appcolors.greyPrimary,
                size: 22.0,
              ),
              suffixIcon: inconsSuffixed != null
                  ? Icon(
                      inconsSuffixed,
                      color: Appcolors.greyPrimary,
                      size: 22.0,
                    )
                  : null,
              hintText: hintext,
              hintStyle: const TextStyle(
                color: Appcolors.blackPrimary,
                fontFamily: 'Outfit',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
    );
  }
}
