import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';

Widget passwordConditionRow(String text, RxBool conditionMet) {
  return Obx(
    () => Row(
      children: [
        Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: conditionMet.value
                ? AppColors.primaryColor
                : Colors.transparent,
            border: Border.all(
              color: conditionMet.value
                  ? AppColors.primaryColor
                  : AppColors.textGrey,
            ),
          ),
          child: conditionMet.value
              ? Icon(Icons.check, size: 12, color: Colors.white)
              : null,
        ),
        SizedBox(width: 8),
        CustomText(text: text, fontSize: 16, fontWeight: FontWeight.w500),
      ],
    ),
  );
}
