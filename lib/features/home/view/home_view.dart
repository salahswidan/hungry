import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/home/widget/card_item.dart';
import 'package:hungry/features/home/widget/food_category.dart';
import 'package:hungry/features/home/widget/search_field.dart';
import 'package:hungry/features/home/widget/user_header.dart';
import 'package:hungry/features/product/view/product_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = ['All', 'Combo', 'Sliders', 'Classic'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              toolbarHeight: 200,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsetsGeometry.only(top: 38, left: 20, right: 20),
                child: Column(children: [UserHeader(), Gap(20), SearchField()]),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 5,
                ),
                child: FoodCategory(
                  category: category,
                  selectedIndex: selectedIndex,
                ),
              ),
            ),
            // card item
            SliverToBoxAdapter(child: Gap(20)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                ),
                delegate: SliverChildBuilderDelegate(childCount: 6, (
                  context,
                  index,
                ) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsView(),
                        ),
                      );
                    },
                    child: CardItem(
                      image: 'assets/product/p1.png',
                      title: 'Cheese Burger',
                      desc: "Wendy's Burger",
                      rate: '4.5',
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
