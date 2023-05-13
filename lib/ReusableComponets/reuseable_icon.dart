import 'package:fast_food/Constants/get_size.dart';
import 'package:fast_food/Constants/styles.dart';
import 'package:flutter/material.dart';

class ReusableIcon extends StatelessWidget {
  final IconData iconData;
  const ReusableIcon({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetSize.getScreenHeight(30),
      width: GetSize.getScreenWidth(35),
      decoration: const BoxDecoration(
        color: Styles.cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Icon(iconData),
    );
  }
}
