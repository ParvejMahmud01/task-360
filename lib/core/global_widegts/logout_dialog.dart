import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/app_sizes.dart';
import 'package:task_360/core/global_widegts/custom_button.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';

void jobCancelDialog({required String message, required String title}) {
  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth() * 0.6,
                child: CustomText(
                  text: title,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.close, color: AppColors.textGrey, size: 20),
              ),
            ],
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
                  text: "No",
                  textColor: AppColors.red,
                  bgColor: Colors.transparent,
                  border: AppColors.red,
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: CustomButton(height: 38, text: "Yes", onTap: () {}),
              ),
            ],
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}
