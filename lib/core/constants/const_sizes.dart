import 'package:flutter/material.dart';

class ConstSizes{
  //100 bo'lishdan maqsad % foizda ifodalash
  static double height(double sizeHeight, BuildContext context) {
    return MediaQuery.of(context).size.height * sizeHeight / 100;
  }

  static double width(double sizeWidth, BuildContext context) {
    return MediaQuery.of(context).size.width * sizeWidth / 100;
  }
}