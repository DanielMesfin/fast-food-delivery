import 'package:flutter/material.dart';
import 'package:fast_food/Constants/get_size.dart';

class Styles {
  static const appBgColor = Color(0xfff2f0f5);
  static const cardColor = Color(0xFFFFFFFF);
  static const appTextColor = Colors.black87;
  static const headerOneText = TextStyle(
    color: appTextColor,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const headerTwoText =
      TextStyle(color: appTextColor, fontSize: 24, fontWeight: FontWeight.w500);
  static const headerThreeText =
      TextStyle(color: appTextColor, fontSize: 22, fontWeight: FontWeight.w400);
  static const headerFourText =
      TextStyle(color: appTextColor, fontSize: 20, fontWeight: FontWeight.bold);
  static const headerFiveTextBlack = TextStyle(
      color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w500);
  static const headerFiveTextGray =
      TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w300);
  static const headerSixTextBlack =
      TextStyle(color: appTextColor, fontSize: 14, fontWeight: FontWeight.w200);
  static const headerSixTextGray =
      TextStyle(color: appTextColor, fontSize: 14, fontWeight: FontWeight.w200);
  static const headerSevenTextBlack =
      TextStyle(color: appTextColor, fontSize: 12, fontWeight: FontWeight.w200);
  static const headerSevenTextGray =
      TextStyle(color: appTextColor, fontSize: 12, fontWeight: FontWeight.w200);

  static const kMessageContainerDecoration = BoxDecoration(
    border: Border(
      top: BorderSide(color: Colors.black, width: 2.0),
    ),
  );
  static const KInputDecoration = InputDecoration(
    // all the border radiuse are about 32 are substituted by 12
    // you can animate the text at all
    hintText: 'Enter the value',
    hintStyle: TextStyle(
      fontSize: 18,
      color: Colors.blueGrey,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 2.7),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
  );
  static const linkText = TextStyle(
      color: Colors.indigoAccent, fontSize: 15, fontWeight: FontWeight.bold);
}
