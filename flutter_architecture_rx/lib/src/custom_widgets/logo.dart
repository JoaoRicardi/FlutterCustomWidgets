import 'package:flutter/material.dart';
import 'package:flutter_architecture_rx/src/values/colors.dart' as colors;
import 'package:flutter_architecture_rx/src/values/dimens.dart' as dimens;

class Logo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.accentColor)
      ),
      child: Icon(Icons.monetization_on,color: colors.accentColor,size: 100,),
    );
  }
}
