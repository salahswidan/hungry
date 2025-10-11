import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/custom_text.dart';

SnackBar CustomSnack(errorMsg) {
  return  SnackBar(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            margin: EdgeInsets.only(bottom: 30, left: 20,right: 20),
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            clipBehavior: Clip.none,
            backgroundColor: Colors.redAccent,
            content: Row(
              children: [
                Icon(CupertinoIcons.info,color: Colors.white,),
                Gap(14),
                CustomText(text: errorMsg, color: Colors.white,weight: FontWeight.w600,size: 13,),
              ],
            ),
          );

}