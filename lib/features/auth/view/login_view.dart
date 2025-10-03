import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_text.dart';

import '../../../shared/custom_text_field.dart';
import '../widget/custom_auth_btn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                  const Gap(10),
                  const CustomText(
                    text: "Welcome Back, Discover the best food",
                    color: Colors.white,
                    size: 13,
                  ),
                  Gap(70),
                  CustomTextField(
                    hint: 'Email Address',
                    isPassword: false,
                    controller: emailController,
                  ),
                  const Gap(10),
                  CustomTextField(
                    hint: 'Password',
                    isPassword: true,
                    controller: passwordController,
                  ),
                  Gap(30),
                  CustomAuthBtn(
                    text: 'Login',
                    formKey: _formKey,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        print('Login Success');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
