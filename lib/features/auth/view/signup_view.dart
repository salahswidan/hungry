import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/auth/view/login_view.dart';
import 'package:hungry/features/auth/widget/custom_auth_btn.dart';
import 'package:hungry/shared/custom_text.dart';
import '../../../core/constants/app_colors.dart';
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
              CustomText(text: "Welcome to our food app"),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(30),
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
                        Gap(20),
                        CustomAuthBtn(
                          color: Colors.transparent,
                          textColor: Colors.white,
                          text: 'Go To Login ?',
                          formKey: _formKey,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
