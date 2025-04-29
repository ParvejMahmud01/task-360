import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/app_sizes.dart';

class CustomSubmitButton extends StatelessWidget {
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
  final BoxShadow? boxShadow;

  const CustomSubmitButton({
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
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(radius ?? 20),
      child: Ink(
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 20),
          border: Border.all(color: border ?? AppColors.primaryColor),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius ?? 20),
          splashColor: Colors.white.withValues(alpha: .3),
          onTap: onTap,
          child: Container(
            height: height ?? getWidth(42, maxWidth: 45),
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: GoogleFonts.inter(
                    fontSize: fontSize ?? getWidth(16, maxWidth: 18),
                    fontWeight: fontWeight ?? FontWeight.w700,
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
