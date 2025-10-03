import 'package:flutter/material.dart';
import 'package:hungry/features/cart/widget/cart_item.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';

class CartView extends StatefulWidget {
  CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late List<int> quantities;
  final int itemCount = 8;

  @override
  void initState() {
    quantities = List.generate(itemCount, (_) => 1);
    super.initState();
  }

  void onAdd(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void onMin(int index) {
    setState(() {
      if (quantities[index] > 1) quantities[index]--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 120, top: 100),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return CartItem(
              text: "Hamburger",
              desc: "Veggie Burger",
              image: "assets/product/p1.png",
              onAdd: () {
                onAdd(index);
              },
              onMin: () {
                onMin(index);
              },
              onRemove: () {},
              number: quantities[index],
            );
          },
        ),
      ),

      bottomSheet: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 100,
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
            CustomButton(text: "Checkout", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
