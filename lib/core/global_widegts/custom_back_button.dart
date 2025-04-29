import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/icons_path.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.iconColor});
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },

      child: SizedBox(
        height: 24,
        width: 24,

        child: Image.asset(
          IconsPath.arrowBack,
          color: iconColor ?? AppColors.textBlack,
        ),
      ),
    );
  }
}
