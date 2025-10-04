import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/custom_button.dart';

import '../../../shared/custom_text.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 120, top: 100),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/product/p1.png", width: 100),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Hamburger",
                              weight: FontWeight.bold,
                            ),
                            CustomText(text: "Qty :x3"),
                            CustomText(text: "Price : 20 \$"),
                          ],
                        ),
                      ],
                    ),
                    Gap(20),
                    CustomButton(text: "Order Again", width: double.infinity),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
