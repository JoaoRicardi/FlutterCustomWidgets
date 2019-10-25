import 'package:flutter/material.dart';
import 'package:flutter_architecture_rx/src/bloc/drawer_bloc.dart';
import 'package:provider/provider.dart';

class CustomDrawerContainer extends StatelessWidget {
  final Widget child;

  const CustomDrawerContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _drawerBloc =  Provider.of<DrawerBloc>(context);
    double screenWidth =  MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: true,
      stream: _drawerBloc.isClosed,
      builder: (context, snapshot) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 400),
          top:snapshot.data ? 0.0 : 0.2 * screenWidth,
          bottom:snapshot.data ? 0.0 : 0.2 * screenWidth,
          left:snapshot.data ? 0.0 : 0.80 * screenWidth,
          right:snapshot.data ? 0.0 :-0.4 * screenWidth,
          child: Material(
            color: Colors.grey[100],
            elevation: 10,
            shadowColor: Colors.black,
            child: child
          )
        );
      }
    );
  }
}