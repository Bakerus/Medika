import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medika/app/core/design/colors.dart';
import '../../modules/signupProfessionnel/controllers/signup_professionnel_controller.dart';

class FilePicker extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData suffixIcon;

  FilePicker({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupProfessionnelController controller = Get.find();
    return Obx(
      () => InkWell(
        onTap: controller.pickFile,
        child: Container(
          height: 60.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Appcolors.greyTextfield,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Row(
            children: [
              Icon(
                prefixIcon,
                color: Appcolors.greyPrimary,
                size: 22.0,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  controller.selectedFileName.value.isEmpty
                      ? hintText
                      : controller.selectedFileName.value,
                  style: TextStyle(
                    color: controller.selectedFileName.value.isEmpty
                        ? Appcolors.blackPrimary.withOpacity(0.6)
                        : Appcolors.blackPrimary,
                    fontFamily: 'Outfit',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                suffixIcon,
                color: Appcolors.greyPrimary,
                size: 22.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
