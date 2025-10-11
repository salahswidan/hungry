import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/view/login_view.dart';
import 'package:hungry/features/auth/widget/custom_user_text_field.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();

  @override
  void initState() {
    _name.text = 'Salah Swidan';
    _email.text = 'salahswidan@gmail.com';
    _address.text = '5 Dubai , UAE';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            child: Icon(Icons.settings, color: Colors.white, size: 30),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://www.bing.com/th/id/OIP.9_MptOLxjJEGSGukPt9FWQHaHa?w=169&h=211&c=8&rs=1&qlt=90&o=6&cb=12&dpr=1.3&pid=3.1&rm=2",
                      ),
                    ),
                    border: Border.all(width: 5, color: Colors.white),
                    borderRadius: BorderRadius.circular(15),

                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              Gap(30),
              CustomUserTextField(controller: _name, label: 'Name'),
              Gap(25),
              CustomUserTextField(controller: _email, label: 'Email'),
              Gap(25),
              CustomUserTextField(controller: _address, label: 'Address'),
              Gap(20),
              Divider(),
              Gap(10),
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                tileColor: Color(0xffF3F4F6),
                leading: Image.asset("assets/icons/visa.png", width: 50),
                title: Text(
                  "Debit Card",
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                  "**** **** 2365",
                  style: TextStyle(color: Colors.black),
                ),
                trailing: CustomText(text: "Default", color: Colors.black),
              ),
              Gap(400),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 70,
        decoration: BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),

                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    CustomText(text: "Edit Profile", color: Colors.white),
                    Gap(5),
                    Icon(Icons.edit),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      CustomText(text: "Logout", color: Colors.black),
                      Gap(5),
                      Icon(Icons.exit_to_app, color: AppColors.primary),
                    ],
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
