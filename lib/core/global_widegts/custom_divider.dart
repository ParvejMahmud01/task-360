import 'package:flutter/material.dart';
import 'package:task_360/core/const/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColors.dividerColor);
  }
}
