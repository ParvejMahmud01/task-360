import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/icons_path.dart';
import 'package:task_360/core/global_widegts/custom_button.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';

void logoutDialog({required String title, required String message}) {
  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(IconsPath.question, height: 100, width: 100),
          const SizedBox(height: 20),
          CustomText(
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textBlack,
          ),
          const SizedBox(height: 20),
          CustomText(
            text: message,
            textAlign: TextAlign.start,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textGrey,
          ),
          const SizedBox(height: 56),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  height: 38,
                  text: "Log Out",
                  textColor: AppColors.primaryColor,
                  bgColor: Colors.transparent,
                  border: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    Get.back();
                    Get.back();
                  },
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: CustomButton(
                  height: 38,
                  text: "Yes",
                  onTap: () {},
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
