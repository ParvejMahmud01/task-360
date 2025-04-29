import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_360/core/const/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Widget? icon;
  final double? radius;
  final Color? bgColor;
  final Color? border;
  final Color? textColor;
  final double? fontSize;
  final double? height;
  final FontWeight? fontWeight;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
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
          color: bgColor ?? AppColors.buttonColor,
          borderRadius: BorderRadius.circular(radius ?? 100),
          border: Border.all(color: border ?? AppColors.buttonColor),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius ?? 100),
          splashColor: Colors.grey.withValues(alpha: .3),
          onTap: onTap,
          child: Container(
            height: height ?? 52,
            width: double.infinity,
            alignment: Alignment.center,

            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: GoogleFonts.inter(
                    fontSize: fontSize ?? 16,
                    fontWeight: fontWeight ?? FontWeight.w600,
                    color: textColor ?? AppColors.white,
                  ),
                ),
                if (icon != null) ...[
                  const SizedBox(width: 5),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.textBlack,
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: icon),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
