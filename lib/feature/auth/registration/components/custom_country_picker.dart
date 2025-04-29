import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';

class CustomCountryPicker extends StatelessWidget {
  const CustomCountryPicker({super.key, required this.controller});

  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 60),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () {
              controller.showCountry(context);
            },
            child: Obx(() {
              final country = controller.selectedCountry.value;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.textfieldBorder,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    country == null
                        ? CustomText(
                            text: "Select Country",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.hintText,
                          )
                        : Row(
                            children: [
                              Text(
                                country.flagEmoji,
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 8),
                              CustomText(
                                text: country.name,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textGrey,
                              ),
                            ],
                          ),
                    Icon(Icons.keyboard_arrow_down, color: AppColors.textBlack),
                  ],
                ),
              );
            }),
          ),
        ),
        const Positioned(
          left: 20,
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomText(
                  text: "Select Country",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
