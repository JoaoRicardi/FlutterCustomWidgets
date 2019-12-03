
import 'package:flutter/material.dart';
import 'package:flutter_architecture_rx/src/bloc/drawer_bloc.dart';
import 'package:flutter_architecture_rx/src/custom_widgets/text.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  final DrawerBloc drawerBloc;
  final AnimationController controller;

  const HomePage({Key key, this.drawerBloc, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Flutter Base'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            drawerBloc.toggle(controller);
          },
        ),
      ),
      body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 100,
            child: CustomText(
              color: Colors.black,
              text: "Este projeto serve como arquitetura base para projetos maiores alem de guardar custom components basicos que permitem a reutilizacao",
            ),
          )
      ),
    );
  }
}
