import 'package:flutter/material.dart';

import 'package:flutter_architecture_rx/src/values/colors.dart' as colors;
import 'package:flutter_architecture_rx/src/values/dimens.dart' as dimens;

class Grid extends StatelessWidget {
  final int size;
  final bool marginContainer;
  final bool marginItem;
  final Widget child;

  const Grid({Key key, this.size, this.marginContainer, this.marginItem, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: size == null ? 1 : size,
      child: _child()
    );
  }

  Widget _child() {
    if (marginContainer == null && marginItem == null) return child;

    return marginContainer == true ? 
      Padding(
        padding: EdgeInsets.all(dimens.margin),
        child: child
      )
    :
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: child
      );
  }
}