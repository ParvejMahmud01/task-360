import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/global_widegts/custom_submit_button.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';

void unsuccessDialog({required String message, required VoidCallback onTap}) {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      backgroundColor: Colors.white,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Column(
        children: [
          // Image.asset(IconsPath.unSuccess, height: 70),
          SizedBox(height: 10),
          CustomText(
            text: 'Success',

            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          SizedBox(height: 10),
          CustomText(
            text: message,
            textAlign: TextAlign.center,

            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ],
      ),
      actions: [
        CustomSubmitButton(
          text: 'Continue',
          onTap: onTap,
          textColor: AppColors.white,
        ),
      ],
    ),
  );
}
