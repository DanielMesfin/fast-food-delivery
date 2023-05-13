import 'package:flutter/material.dart';
import 'package:fast_food/Constants/get_size.dart';
import 'package:get/get.dart';

class RerusableMatterialButton extends StatelessWidget {
  final Color colorInput;
  final Function()? onPressInput;
  final String textLabel;
  RerusableMatterialButton({
    super.key,
    this.onPressInput,
    required this.colorInput,
    required this.textLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: GetSize.getScreenHeight(16),
      ),
      child: Material(
        elevation: 7.0,
        color: colorInput,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: onPressInput,
          minWidth: 200.0,
          height: GetSize.getScreenHeight(40.0),
          child: Text(
            textLabel,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
