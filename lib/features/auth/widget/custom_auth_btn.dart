import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class CustomAuthBtn extends StatelessWidget {
  const CustomAuthBtn({
    super.key,
    required this.text,
    required this.formKey,
    this.onTap,
    this.color,
    this.textColor,
  });
  final String text;
  final GlobalKey<FormState> formKey;
  final void Function()? onTap;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: CustomText(
            text: text,
            size: 15,
            color: textColor?? AppColors.primary,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
