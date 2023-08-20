import 'package:flutter/material.dart';

class SizeConfig {
  late BuildContext context;
  static late double screenWidth;
  static late double screenHeight;
  static late double screenTopHeight;
  static late double screenFullHeight;

  SizeConfig.init(this.context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenTopHeight = MediaQuery.of(context).viewPadding.top;
    screenFullHeight = MediaQuery.sizeOf(context).height;
    screenHeight = screenFullHeight - screenTopHeight;
  }
}

getConfigWidth(double width) {
  return SizeConfig.screenWidth * width;
}

getConfigHeight(double height) {
  return SizeConfig.screenHeight * height;
}

getConfigTopHeight() {
  return SizeConfig.screenTopHeight;
}

getConfigFullHeight() {
  return SizeConfig.screenFullHeight;
}
