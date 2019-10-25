import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_rx/src/bloc/drawer_bloc.dart';
import 'package:flutter_architecture_rx/src/custom_widgets/drawer/items/list_item_drawer.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _drawerBloc =  Provider.of<DrawerBloc>(context);
  
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromRGBO(20, 20, 20, 1),
        ),
        child: Stack(
          children: <Widget>[
           StreamBuilder<bool>(
             stream: _drawerBloc.isClosed,
             builder: (context, snapshot) {
               return ListItemDrawer(
                 onPress:() => _drawerBloc.navigateTo(
                     page: null,
                     context: context,
                     i: 0
                 ),
                 isClosed: snapshot.data,
                 nome: 'Contas',
                 valor: -90,
                 comparativo: 0,
                 stream: _drawerBloc.selected,
               );
             }
           ),
           StreamBuilder<bool>(
             stream: _drawerBloc.isClosed,
             builder: (context, snapshot) {
               return ListItemDrawer(
                 isClosed: snapshot.data,
                 onPress:() => _drawerBloc.navigateTo(
                     page: null,
                     context: context,
                     i: 1
                 ),
                 nome: 'Nome da pagina',
                 valor: 0,
                 comparativo: 1,
                 stream: _drawerBloc.selected,
               );
             }
           ),
           StreamBuilder<bool>(
             stream: _drawerBloc.isClosed,
             builder: (context, snapshot) {
               return ListItemDrawer(
                 isClosed: snapshot.data,
                 onPress:() => _drawerBloc.navigateTo(
                     page: null,//Uma pagina
                     context: context,
                     i: 2
                 ),
                 nome: 'Nome da pagina',
                 valor: 90,
                 comparativo: 2,
                 stream: _drawerBloc.selected,
               );
             }
           )
          ],
        ),
      ),
    );
  }
}

