import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.rate,
  });
  final String image;
  final String title;
  final String desc;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(image, width: 120, height: 120)),
            Gap(15),
            CustomText(
              text: title,
              size: 16,
              color: Colors.black,
              weight: FontWeight.bold,
            ),
            CustomText(text: desc, size: 16, color: Colors.black),
            Row(
              children: [
                CustomText(text: "⭐ ${rate}", size: 16, color: Colors.black),
                Spacer(),
                Icon(CupertinoIcons.heart_fill, color: AppColors.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
