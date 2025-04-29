import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneInput extends StatelessWidget {
  const CustomPhoneInput({
    super.key,
    required this.controller,
    required this.onPhoneChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String> onPhoneChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 60),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.textfieldBorder, width: 1),
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IntlPhoneField(
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              showCursor: true,
              keyboardType: TextInputType.phone,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textBlack,
              ),
              decoration: InputDecoration(
                hintText: "Phone Number",
                hintStyle: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hintText,
                ),
                labelStyle: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBlack,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
              initialCountryCode: 'UK',
              dropdownIcon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.hintText,
              ),
              dropdownTextStyle: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textBlack,
              ),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.transparent),
              ),
              disableLengthCheck: true,
              onChanged: (phone) {
                onPhoneChanged(
                  phone.completeNumber.isEmpty ? '' : phone.completeNumber,
                );
              },
            ),
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: const CustomText(
              text: "Phone Number",
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
