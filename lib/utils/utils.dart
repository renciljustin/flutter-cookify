import 'package:cookify/constants/fontfamily_constant.dart';
import 'package:flutter/material.dart';

class Utils {
  static ThemeData get customTheme {
    return ThemeData(
        accentColor: Colors.green,
        canvasColor: Colors.brown.shade100,
        fontFamily: FontFamilyConstant.RALEWAY,
        primaryColor: Colors.brown,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.grey.shade900),
              bodyText2: TextStyle(color: Colors.grey.shade900),
              subtitle1: TextStyle(
                  color: Colors.grey.shade900,
                  fontFamily: FontFamilyConstant.ROBOTO_CONDENSED,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
              subtitle2: TextStyle(
                color: Colors.grey.shade900,
                fontFamily: FontFamilyConstant.ROBOTO_CONDENSED,
                fontSize: 20.0,
              ),
            ));
  }
}
