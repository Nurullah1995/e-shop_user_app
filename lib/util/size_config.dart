import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;

  static double safeAreaHorizontal;
  static double safeAreaVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    safeAreaHorizontal = _mediaQueryData.size.width - (_mediaQueryData.padding.left +
        _mediaQueryData.padding.right);
    safeAreaVertical = _mediaQueryData.size.height - (_mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom);

  }

  static double customHeight(double offset)
  {
    return screenHeight * offset;
  }

  double customWidth(double offset)
  {
    return screenWidth * offset;
  }
}