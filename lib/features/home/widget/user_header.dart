import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(30),
            SvgPicture.asset(
              "assets/logo/logo.svg",
              colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              height: 35,
            ),
            Gap(5),
            CustomText(
              text: "Hello, Salah Swidan",
              size: 18,
              color: Colors.grey.shade500,
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: AppColors.primary,
          radius: 28,
          child: Icon(Icons.person, color: Colors.white),
        ),
      ],
    );
  }
}
