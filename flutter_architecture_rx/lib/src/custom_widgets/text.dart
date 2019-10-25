import 'package:flutter/material.dart';
import 'package:flutter_architecture_rx/src/values/colors.dart' as colors;
import 'package:flutter_architecture_rx/src/values/dimens.dart' as dimens;

class CustomText extends StatelessWidget {
  final String text;
  final bool title;
  final bool bold;
  final bool big;
  final bool small;
  final bool center;
  final bool white;
  final bool dark;
  final bool accent;
  final bool primary;
  final bool primaryDark;
  final Color color;
  final int maxLines;
  final bool realBig;

  const CustomText({Key key,this.realBig, this.text, this.title, this.bold, this.big, this.small, this.center, this.white, this.dark, this.accent, this.primary, this.primaryDark, this.color, this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String textValue = text ?? "";

    final double fontSize = title == true ?
          dimens.fontTextTitle 
        : 
        realBig ==true ? 30 :
          big == true ? dimens.fontTextBig :
            small == true ? dimens.fontTextSmall : dimens.fontText; 

    final Color customColor = primaryDark == true ? 
      colors.primaryColorDark
    : 
      white == true ? Colors.white : 
        accent == true ? colors.accentColor : colors.primaryColor;

    return Text(
      textValue,
      maxLines: maxLines,
      textAlign: center == true ? TextAlign.center : null,
      style: TextStyle(
        fontFamily: bold == true ? "RobotoBold" : 'RobotoRegular',
        decoration: TextDecoration.none,
        fontSize: fontSize,
        color: color == null ? 
            dark == true ? colors.backgroundColor : customColor 
          : 
            color
      )
    );
  }
}