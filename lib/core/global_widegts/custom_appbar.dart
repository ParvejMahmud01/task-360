import 'package:flutter/material.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/global_widegts/custom_back_button.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    this.topPadding,
    this.backButton,
    this.textColor,
  });
  final String text;
  final double? topPadding;
  final Widget? backButton;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          backButton ?? CustomBackButton(),

          CustomText(
            text: text,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor ?? AppColors.textBlack,
          ),
          SizedBox(height: 24, width: 24),
        ],
      ),
    );
  }
}
