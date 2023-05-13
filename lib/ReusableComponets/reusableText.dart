import 'package:flutter/material.dart';
import 'package:fast_food/Constants/get_size.dart';
import 'package:fast_food/Constants/styles.dart';
class ReusableSizeText extends StatelessWidget {
  final Function()? callBackActionForQuantity;
  final String textLabel;
  final Color pasedColor;
  const ReusableSizeText(
      {super.key,
        required this.textLabel,
        required this.pasedColor,
        required this.callBackActionForQuantity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callBackActionForQuantity,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: GetSize.getScreenWidth(10),
          vertical: GetSize.getScreenHeight(3),
        ),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            color: pasedColor),
        child: Text(
          textLabel,
          style: Styles.headerFiveTextBlack.copyWith(color: Colors.black87),
        ),
      ),
    );
  }
}
