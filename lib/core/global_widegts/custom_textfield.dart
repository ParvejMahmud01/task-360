import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? height;
  final double? radius;
  final Color? borderColor;
  final bool? readOnly;
  final String title;
  final int? maxLines;
  final void Function()? onTap;
  final ValueChanged<String>? onChanged;
  final bool obsecureText;
  final TextInputType? textInputType;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintext,
    required this.title,

    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.obsecureText = false,
    this.textInputType,
    this.height,
    this.radius,
    this.borderColor,
    this.readOnly,
    this.onTap,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 60),
        Padding(
          padding: EdgeInsets.only(top: 10),

          child: Container(
            height: height ?? 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,

              border: Border.all(color: AppColors.textfieldBorder, width: 1),
              borderRadius: BorderRadius.circular(radius ?? 6),
            ),
            child: Center(
              child: TextField(
                onTap: onTap,
                autofocus: false,
                controller: controller,
                maxLines: maxLines ?? 1,
                obscureText: obsecureText,
                keyboardType: textInputType,
                onChanged: onChanged,
                readOnly: readOnly ?? false,

                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBlack,
                ),
                decoration: InputDecoration(
                  hintText: hintext,
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,

                  hintStyle: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.hintText,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,

          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: CustomText(
              text: title,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
