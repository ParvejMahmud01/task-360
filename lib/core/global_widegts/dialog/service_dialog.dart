import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/image_path.dart';
import 'package:task_360/core/global_widegts/custom_button.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';

void serviceDialog({
  required String message,
  required String buttonText,
  required VoidCallback onTap,
}) {
  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(ImagePath.serviceImage, height: 186, width: 209),
          const SizedBox(height: 20),
          CustomText(
            text: "Congratulations!",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textBlack,
          ),
          const SizedBox(height: 20),
          CustomText(
            text: message,
            textAlign: TextAlign.center,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textGrey,
          ),
          const SizedBox(height: 56),
          CustomButton(
            height: 38,
            text: buttonText,
            onTap: onTap,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    ),
  );
}
