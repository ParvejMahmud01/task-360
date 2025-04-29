import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/icons_path.dart';
import 'package:task_360/core/global_widegts/custom_submit_button.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';
import 'package:task_360/core/route/routes.dart';

void showPassword({String title = 'Password Changed', String? iconPath}) {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Column(
        children: [
          SizedBox(
            height: 160,
            width: 160,

            child: Image.asset(iconPath ?? IconsPath.password),
          ),
          const SizedBox(height: 10),
          CustomText(
            text: title,

            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textBlack,
          ),
          const SizedBox(height: 8),
          CustomText(
            text:
                "Password changed succesfully, you can\n login again with new password",
            textAlign: TextAlign.center,

            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textGrey,
          ),
        ],
      ),
      actions: [
        CustomSubmitButton(
          text: 'Login',
          onTap: () {
            Get.toNamed(AppRoutes.login);
          },
          textColor: AppColors.white,
        ),
      ],
    ),
  );
}
