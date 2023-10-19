import 'dart:ui';

import 'package:flutter/material.dart';

/// the size of the screen of the device that the app is running on
Size size = PlatformDispatcher.instance.views.first.physicalSize /
    PlatformDispatcher.instance.views.first.devicePixelRatio;

/// the padding of the design is set to 30
double designPadding = 30;

/// the padding of the design is set to 24
double designPadding24 = 24;

/// the padding of the design is set to 12
double designPadding12 = 12;

/// the padding of the design is set to 30
double designPaddingBetween = 8;

/// the padding center of the design is set to 6
double designPaddingCenter = 6;

/// the radius of the design is set to 8
double designRadius8 = 8.0;

/// the radius of the design is set to 18
double designRadius18 = 18.0;

/// the radius of the design is set to 150
double designRoundedRadius = 150.0;

///This method is used to get device viewport width.
double get width => size.width;

///This method is used to get device viewport height.
num get height {
  final num statusBar = MediaQueryData.fromView(
    PlatformDispatcher.instance.views.first,
  ).viewPadding.top;
  final num screenHeight = size.height - statusBar;
  return screenHeight;
}
