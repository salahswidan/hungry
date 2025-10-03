import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/shared/custom_text.dart';

import '../core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(18),
        ),
        child: CustomText(text: text, color: Colors.white),
      ),
    );
  }
}
