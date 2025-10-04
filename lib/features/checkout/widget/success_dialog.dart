import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_text.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            blurRadius: 20,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.primary,
            child: Icon(
              CupertinoIcons.check_mark,
              size: 30,
              color: Colors.white,
            ),
          ),
          Gap(10),
          CustomText(
            text: "Success!",
            color: AppColors.primary,
            size: 20,
            weight: FontWeight.bold,
          ),
          Gap(3),
          CustomText(
            text:
                "Your payment was successful. \nA receipt for this purchase \nhas been sent to your email.",
            color: Colors.grey,
            size: 14,
          ),
          Gap(20),
          CustomButton(
            text: "Close",
            width: 200,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
