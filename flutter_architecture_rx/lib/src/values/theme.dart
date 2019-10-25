import 'package:flutter/material.dart';
import 'colors.dart' as colors;

final ThemeData theme = ThemeData(
  accentColor: colors.accentColor,
  primaryColor: colors.primaryColor,
  primaryColorDark: colors.primaryColorDark,

  fontFamily: "RobotoRegular",
  
  scaffoldBackgroundColor: colors.backgroundColor,
  //canvasColor: colors.canvasColor,

  appBarTheme: AppBarTheme(
    color: colors.backgroundColor,
    iconTheme: IconThemeData(color: colors.accentColor)
  ),
  
  buttonTheme: ButtonThemeData(
    //buttonColor: colors.accentLightColor,
    disabledColor: colors.primaryColorDark
  )
);
