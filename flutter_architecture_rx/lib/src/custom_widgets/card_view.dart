import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final Alignment alignment;
  final double width;
  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double elevation;
  final Widget child;
  final Color backgroundColor;

  const CardView({
    Key key, 
    this.alignment, 
    this.width,
    this.height,
    this.elevation,
    this.margin, 
    this.padding,
    this.backgroundColor, 
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(
          color: backgroundColor != null ? backgroundColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 1),
              color: Colors.black12,
              blurRadius: elevation == null ? 6.0 : elevation,
            )
          ]
        ),
        child: child
    );
  }
}
