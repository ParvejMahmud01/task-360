import 'package:flutter/material.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';

class OrSignUnWith extends StatelessWidget {
  const OrSignUnWith({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(color: AppColors.textfieldBorder),
          ),
        ),
        SizedBox(width: 5),
        CustomText(text: text, color: AppColors.textGrey, fontSize: 14),
        SizedBox(width: 5),
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(color: AppColors.textfieldBorder),
          ),
        ),
      ],
    );
  }
}
