import 'package:flutter/material.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/image_path.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';

class CustomErrorText extends StatelessWidget {
  const CustomErrorText({super.key, this.text, this.color});
  final String? text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(80),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImagePath.error),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: CustomText(
              text: text ?? "Empty Service",
              fontSize: 24,
              color: color ?? AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
