import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenHeight;
  static late double screenWidth;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }
}

double getSystemFontSize(BuildContext context, double size) {
  double systemSize = MediaQuery.of(context).textScaleFactor;
  if (systemSize < 1.0) {
    return (systemSize * (12 + size)); //38 header, 30 sub header, 22 contents||26,18,10
  } else if (systemSize >= 1.0 && systemSize < 1.25) {
    return (systemSize * (4 + size)); //28 header, 20 sub header, 12 contents||26,18,10
  } else if (systemSize >= 1.25 && systemSize < 1.4) {
    //22 header, 16 sub header, 12 contents||26,18,10
    if (size <= 10) {
      return (systemSize * (1 + size));
    } else if (size <= 18 && size > 10) {
      return (systemSize * (size - 2));
    } else if (size > 18) {
      return (systemSize * (size - 4));
    }
  } else if (systemSize >= 1.4) {
    if (size <= 10) {
      return (systemSize * (size - 1));
    } else if (size <= 18 && size > 10) {
      return (systemSize * (size - 7));
    } else if (size > 18) {
      return (systemSize * (size - 11));
    }
    // return (systemSize * 15);//15 header, 11 sub header, 9 contents
  }
  return null as double;
}

MediaQueryData getScreenSize(BuildContext context) {
  return MediaQuery.of(context);
}

double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight;
}

double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth;
}

double getScreenPixel(double pixel) {
  return pixel.sp;
}

double getScreenHeight(double height) {
  return height.h;
}

double getScreenWidth(double width) {
  return width.w;
}
