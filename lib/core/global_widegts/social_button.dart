import 'package:flutter/material.dart';
import 'package:task_360/core/const/app_colors.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final double? radius;
  final Color? bgColor;
  final Color? border;
  final Color? textColor;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;

  const SocialButton({
    super.key,
    required this.icon,
    required this.onTap,

    this.bgColor,
    this.border,
    this.textColor,
    this.radius,
    this.fontSize,
    this.height,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(radius ?? 8),
      child: Ink(
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.white,
          borderRadius: BorderRadius.circular(radius ?? 10),
          border: Border.all(color: border ?? AppColors.textfieldBorder),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius ?? 10),
          splashColor: Colors.grey.withValues(alpha: .3),
          onTap: onTap,
          child: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(icon),
            ),
          ),
        ),
      ),
    );
  }
}
