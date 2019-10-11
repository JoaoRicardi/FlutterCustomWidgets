import 'package:flutter/material.dart';
import 'package:speed_dial/src/pages/radial_menu.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Radial Menu',
        home: Scaffold(
            body: Stack(
              children: <Widget>[
                RadialMenu()
              ],
            )//SizedBox.expand(child: RadialMenu())
        )
    );
  }
}

