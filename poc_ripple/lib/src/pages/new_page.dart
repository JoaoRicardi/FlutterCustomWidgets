import 'package:flutter/material.dart';
import 'package:poc_ripple/src/clipper/custom_cliper.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClipPath'),
      ),
      body: ClipPath(
        clipper: MyCustomClipper(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          color: Colors.red,

        ),


      ),
    );
  }
}