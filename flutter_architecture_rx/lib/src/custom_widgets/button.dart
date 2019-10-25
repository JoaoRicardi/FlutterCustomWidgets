import 'package:flutter/material.dart';
import 'package:flutter_architecture_rx/src/custom_widgets/text.dart';

import 'package:flutter_architecture_rx/src/values/colors.dart' as colors;
import 'package:flutter_architecture_rx/src/values/dimens.dart' as dimens;

class CustomButton extends StatelessWidget {
  final bool primary;
  final String label;
  final Function onPress;
  final bool disabled;

  final double _elevation = 3;

  const CustomButton({
    Key key, 
    this.primary,
    this.label,
    this.onPress,
    this.disabled
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final action = disabled == true ? null : onPress;

    if (primary == true) {
      return InkWell(
        onTap: onPress,
        child: Container(
          child: CustomText(
            text: label,
            accent: true,
          ),

        ),
      );
    }
    return RaisedButton(
      color: colors.accentColor,//primary == false ? colors.accentColor : colors.accentLightColor,
      textColor: Colors.white,
      onPressed: action,
      elevation: _elevation,
      child: Text(
        label ?? "Label", 
        style: TextStyle(
          color: colors.backgroundColor,
          letterSpacing: 1,
          fontSize: dimens.fontButton + 1
        )
      ),
    );
  }
}