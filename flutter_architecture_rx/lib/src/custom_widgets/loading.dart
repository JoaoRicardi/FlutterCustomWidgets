import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'text.dart';
import 'package:flutter_architecture_rx/src/values/colors.dart' as colors;
import 'package:flutter_architecture_rx/src/values/dimens.dart' as dimens;


class Loading extends StatelessWidget {
  final Color backgroundColor;
  final String message;
  final Observable<bool> status;
  final Widget child;

  const Loading({ Key key, this.status, this.child, this.message, this.backgroundColor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        _loading(status)
      ],
    );
  }

  Widget _loading(loading) {
    return StreamBuilder(
      stream: loading,
      builder: (context, snashop) {
        return snashop.data == true ?
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            alignment: Alignment.center,
            color: backgroundColor == null ? Colors.white.withOpacity(0.8) : backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomText(
                    text: message,
                    white: backgroundColor != null ? false : true,
                    primaryDark: backgroundColor == null ? false : true,
                  ),
                ),
                CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: new AlwaysStoppedAnimation<Color>(colors.accentColor),
                )
              ]
            ),
          )
          : 
          Container();
      },
    );
  }
}