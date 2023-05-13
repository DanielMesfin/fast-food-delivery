import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetSize {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getHeight() {
    return Get.height;
  }

  static getWidth() {
    return Get.width;
  }

  static getScreenHeight(double pixels) {
    double h = getHeight() / pixels;
    return getHeight() / h;
  }

  static getScreenWidth(double pixels) {
    double w = getWidth() / pixels;
    return getWidth() / w;
  }
}
