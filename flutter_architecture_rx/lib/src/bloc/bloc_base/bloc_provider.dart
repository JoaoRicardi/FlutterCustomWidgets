import 'package:flutter/material.dart';
import 'package:flutter_architecture_rx/src/bloc/custom_bloc.dart';
import 'package:flutter_architecture_rx/src/bloc/drawer_bloc.dart';
import 'package:provider/provider.dart';
class BlocProvider extends StatelessWidget {
  final Widget child;

  const BlocProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => CustomBloc()),
        ChangeNotifierProvider(builder: (context) => DrawerBloc()),

      ],
      child: child,
    );
  }
}