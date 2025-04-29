import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/icons_path.dart';

class ImageComponents extends StatelessWidget {
  const ImageComponents({super.key, required this.controller});

  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(0.5),
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor),
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: controller.selectedImagePath.value.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Image.asset(
                        IconsPath.profile,
                        fit: BoxFit.cover,
                        height: 120,
                        width: 120,
                      ),
                    )
                  : Image.file(
                      controller.getSelectedImage(),
                      fit: BoxFit.cover,
                      height: 120,
                      width: 120,
                    ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                controller.showImageSourceDialog(context);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.primaryColor),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.camera_alt, color: AppColors.primaryColor),
              ),
            ),
          ),
        ],
      );
    });
  }
}
