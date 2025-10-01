import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/auth/widget/custom_auth_btn.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';
import '../../../shared/custom_text_field.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(100),
                SvgPicture.asset('assets/logo/logo.svg'),
                Gap(70),
                CustomTextField(
                  hint: 'Name',
                  isPassword: false,
                  controller: nameController,
                ),
                const Gap(15),
                CustomTextField(
                  hint: 'Email Address',
                  isPassword: false,
                  controller: emailController,
                ),
                const Gap(15),
                CustomTextField(
                  hint: 'Password',
                  isPassword: true,
                  controller: passController,
                ),
                const Gap(15),
                CustomTextField(
                  hint: 'Confirm Password',
                  isPassword: true,
                  controller: confirmPassController,
                ),
                Gap(30),
                CustomAuthBtn(
                  text: 'Sign up',
                  formKey: _formKey,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print('Sign up Success');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
