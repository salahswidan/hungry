import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/auth/view/login_view.dart';
import 'package:hungry/features/auth/widget/custom_auth_btn.dart';
import 'package:hungry/shared/custom_text.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/network/api_error.dart';
import '../../../root.dart';
import '../../../shared/custom_snack.dart';
import '../../../shared/custom_text_field.dart';
import '../data/auth_repo.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  AuthRepo authRepo = AuthRepo();

  Future<void> signup() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      try {
        final user = await authRepo.signup(
          nameController.text.trim(),

          emailController.text.trim(),
          passController.text.trim(),
        );
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Root()),
          );
        }
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        String errorMsg = 'unhandled error in register';
        if (e is ApiError) {
          errorMsg = e.message;
        }
        ScaffoldMessenger.of(context).showSnackBar(CustomSnack(errorMsg));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
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
                          isLoading
                              ? CupertinoActivityIndicator(color: Colors.white)
                              : CustomAuthBtn(
                                  text: 'Sign up',
                                  formKey: _formKey,
                                  onTap: signup,
                                ),
                          Gap(20),
                          CustomAuthBtn(
                            color: Colors.transparent,
                            textColor: Colors.white,
                            text: 'Go To Login ?',
                            formKey: _formKey,
                            onTap: () {
                              Navigator.pushReplacement(
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
      ),
    );
  }
}
