import 'package:flutter/material.dart';
import 'package:flutter_architecture_rx/src/bloc/drawer_bloc.dart';
import 'package:flutter_architecture_rx/src/custom_widgets/drawer/drawer.dart';
import 'package:flutter_architecture_rx/src/custom_widgets/drawer/drawer_container.dart';
import 'package:flutter_architecture_rx/src/pages/home/home_page.dart';
import 'package:provider/provider.dart';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {


  //Animation<double> _scaleAnimation;
  AnimationController controller;
  Animation placeAnimation;
  Animation sizeAnimation;
  Animation borderAnimation;

  DrawerBloc drawerBloc;

  @override
  void initState() {


    super.initState();

    controller = AnimationController(vsync: this,duration:Duration(milliseconds: 400));
   // _scaleAnimation = Tween<double>(begin:1,end: 1).animate(_controller);

    placeAnimation = Tween(begin: 0.0, end: 300.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    placeAnimation.addListener(() {
      setState(() {});
    });

    sizeAnimation = Tween(begin: 1.0, end: 0.8)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    sizeAnimation.addListener(() {
      setState(() {});
    });

    borderAnimation = Tween(begin: 0.0, end: 10.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    borderAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {

    drawerBloc = Provider.of<DrawerBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomDrawer(
          drawerBloc: drawerBloc,
        ),
        CustomDrawerContainer(
          sizeAnimation: sizeAnimation,
          animationController: controller,
          borderAnimation: borderAnimation,
          placeAnimation: placeAnimation,
          drawerBloc: drawerBloc,
          child: HomePage(
            drawerBloc: drawerBloc,
            controller: controller,
          ),
        )
      ],
    );
  }
}
