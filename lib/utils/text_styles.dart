import 'package:flutter/material.dart';
import 'package:tragon_machine_test/utils/colors.dart';

TextStyle titleStyle() {
  return const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
}

TextStyle titleStyleSmall(double size) {
  return  TextStyle(fontSize: size, fontWeight: FontWeight.w600);
}

TextStyle appBarTitleStyle() {
  return const TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
}


TextStyle normalText() {
  return const TextStyle(fontSize: 12);
}

TextStyle productDispritionText() {
  return const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

TextStyle productPriceText(double size) {
  return  TextStyle(
    fontSize: size,
    fontWeight: FontWeight.bold,
    color: Colors.green,
  );
}
TextStyle productFadeText(double size) {
  return  TextStyle(
      fontSize:size ,
    fontWeight: FontWeight.w600,
    color: greyColor,
  );
}
TextStyle productDiscoundText(double size) {
  return  TextStyle(
                      fontSize: size,
                      fontWeight: FontWeight.bold,
                      color: redColor,
                    );
}
TextStyle productReviewText(double size) {
  return  TextStyle(
      fontSize:size ,
    fontWeight: FontWeight.w600,
    
  );
}

