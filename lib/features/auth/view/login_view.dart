import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/view/signup_view.dart';
import 'package:hungry/root.dart';
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
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(200),
                SvgPicture.asset(
                  'assets/logo/logo.svg',
                  color: AppColors.primary,
                ),
                const Gap(10),
                const CustomText(
                  text: "Welcome Back, Discover the best food",
                  color: AppColors.primary,
                  size: 13,
                ),
                Gap(100),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Gap(30),
                        CustomTextField(
                          hint: 'Email Address',
                          isPassword: false,
                          controller: emailController,
                        ),
                        const Gap(15),
                        CustomTextField(
                          hint: 'Password',
                          isPassword: true,
                          controller: passwordController,
                        ),
                        Gap(20),
                        CustomAuthBtn(
                          text: 'Login',
                          formKey: _formKey,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              print('Login Success');
                            }
                          },
                        ),
                        Gap(20),
                        CustomAuthBtn(
                          color: Colors.transparent,
                          textColor: Colors.white,
                          text: 'Create Account ?',
                          formKey: _formKey,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupView(),
                              ),
                            );
                          },
                        ),
                        Gap(20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Root()),
                            );
                          },
                          child: CustomText(
                            text: 'Continue as a guest ?',
                            size: 13,
                            color: Colors.amberAccent,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
