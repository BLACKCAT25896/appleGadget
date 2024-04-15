import 'package:flutter/material.dart';

Color background = const Color(0xfff3f2ee);
Color darkShadow = const Color(0xffcfceca);
Color lightShadow = const Color(0xffffffff);

Color qDarkShadow = const Color(0xff5735f8);
Color qLightShadow = const Color(0xff775aff);

Color textColor = const Color(0xff001f3f);

Color onlineIndicator = const Color(0xff0ee50a);

var softShadows = [
  BoxShadow(
      color: darkShadow,
      offset: const Offset(2.0, 2.0),
      blurRadius: 2.0,
      spreadRadius: 1.0),
  BoxShadow(
      color: lightShadow,
      offset: const Offset(-2.0, -2.0),
      blurRadius: 2.0,
      spreadRadius: 1.0),
];



var softShadowsInvert = [
  BoxShadow(
      color: lightShadow,
      offset: const Offset(2.0, 2.0),
      blurRadius: 2.0,
      spreadRadius: 2.0),
  BoxShadow(
      color: darkShadow,
      offset: const Offset(-2.0, -2.0),
      blurRadius: 2.0,
      spreadRadius: 2.0),
];
