import 'package:flutter/material.dart';
import 'package:hungry/shared/custom_text.dart';

class ToppingCard extends StatelessWidget {
  const ToppingCard({
    super.key,
    required this.image,
    required this.title,
    required this.onAdd,
  });
  final String image;
  final String title;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 85,
            width: 110,
            color: Color(0xff3C2F2F),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
               
              ],
            ),
          ),
        ),
        Positioned(
          top: -40,
          right: -5,
          left: -5,
          child: SizedBox(
            height: 80,
            width: 70,
            child: Card(
              color: Colors.white,
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: title,
                  color: Colors.white,
                  size: 15,
                  weight: FontWeight.w600,
                ),
                GestureDetector(
                  onTap: onAdd,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.add, color: Colors.white, size: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
