import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/app_sizes.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({
    super.key,
    required this.controller,
    required this.selectedValue,
    required this.menuItems,
    this.iconPath,
    required this.hintText,
    required this.title,
  });

  final RxString selectedValue;
  final List<String> menuItems;
  final String? iconPath;
  final String hintText, title;
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 60),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () {
              _showPopupMenu(context);
            },
            child: Container(
              height: 48,
              padding: EdgeInsets.only(left: iconPath != null ? 14 : 0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: AppColors.textfieldBorder),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (iconPath != null)
                        Image.asset(iconPath!, height: 16, width: 16),
                      if (iconPath != null) SizedBox(),
                      SizedBox(width: getWidth(17)),
                      Obx(() {
                        return SizedBox(
                          width: screenWidth() * 0.6,
                          child: CustomText(
                            text: selectedValue.value.isNotEmpty
                                ? selectedValue.value
                                : hintText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGrey,
                          ),
                        );
                      }),
                    ],
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      popupMenuTheme: PopupMenuThemeData(
                        color: Colors
                            .white, // Set your custom background color here
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: PopupMenuButton<String>(
                      offset: Offset(0, 60),
                      onSelected: (value) {
                        selectedValue.value = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return menuItems.map((item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: SizedBox(
                              width: screenWidth() * 0.6,
                              child: CustomText(
                                text: item,
                                fontSize: getWidth(14),
                                fontWeight: FontWeight.w500,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        }).toList();
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.textGrey,
                        size: 30,
                      ),
                    ),
                  ),
                ],
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

  void _showPopupMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset target = button.localToGlobal(Offset.zero, ancestor: overlay);

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(target, target),
      Offset.zero & overlay.size,
    );

    showMenu<String>(
      context: context,
      position: position,
      items: menuItems.map((item) {
        return PopupMenuItem<String>(
          value: item,
          child: SizedBox(
            width: screenWidth() * 0.6,
            child: CustomText(
              text: item,
              fontSize: getWidth(14),
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
      // Optional: You can set a default color for manual popup as well (though it's less effective than Theme)
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ).then((value) {
      if (value != null) {
        selectedValue.value = value;
      }
    });
  }
}
