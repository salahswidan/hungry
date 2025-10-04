import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/checkout/widget/checkout_details_widget.dart';
import 'package:hungry/shared/custom_text.dart';

import '../../../shared/custom_button.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedMethod = 'Cash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Order Summary",
                size: 20,
                weight: FontWeight.w500,
              ),
              Gap(10),

              CheckoutDetailsWidget(
                order: "18.9",
                taxes: "3.5",
                fees: "2.4",
                total: "100.00",
              ),
              Gap(80),
              CustomText(
                text: "Payment Methods",
                size: 20,
                weight: FontWeight.w500,
              ),
              Gap(15),
              ListTile(
                onTap: () => setState(() => selectedMethod = 'Cash'),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                tileColor: Color(0xff3C2F2F),
                leading: Image.asset("assets/icons/cash.png", width: 50),
                title: Text(
                  "Cash On Delivery",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Radio<String>(
                  value: 'Cash',
                  activeColor: Colors.white,
                  groupValue: selectedMethod,
                  onChanged: (v) {
                    setState(() {
                      selectedMethod = v!;
                    });
                  },
                ),
              ),
              Gap(10),
              ListTile(
                onTap: () => setState(() => selectedMethod = 'Visa'),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                tileColor: Colors.blue.shade600,
                leading: Image.asset("assets/icons/visa.png", width: 50),
                title: Text(
                  "Debit Card",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "**** **** 2365",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Radio<String>(
                  value: 'Visa',
                  activeColor: Colors.white,
                  groupValue: selectedMethod,
                  onChanged: (v) {
                    setState(() {
                      selectedMethod = v!;
                    });
                  },
                ),
              ),
              Gap(5),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (v) {},
                    activeColor: AppColors.primary,
                  ),
                  CustomText(text: "Save card details for future payments"),
                ],
              ),
              Gap(200),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              blurRadius: 20,
              offset: Offset(0, 1),
            ),
          ],
        ),
        padding: EdgeInsets.all(15),
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Total", size: 15),
                CustomText(text: "\$ 18.9", size: 24),
              ],
            ),
            CustomButton(text: "Pay Now", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
