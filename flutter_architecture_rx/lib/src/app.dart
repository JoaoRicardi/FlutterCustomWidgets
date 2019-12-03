import 'package:flutter/material.dart';
import 'package:flutter_architecture_rx/src/bloc/bloc_base/bloc_provider.dart';
import 'package:flutter_architecture_rx/src/pages/home/home_page.dart';
import 'package:flutter_architecture_rx/src/pages/profile/profile_page.dart';
import 'package:flutter_architecture_rx/src/values/theme.dart' as appTheme;
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme.theme,
          home: ProfilePage()
      ),
    );
  }
}