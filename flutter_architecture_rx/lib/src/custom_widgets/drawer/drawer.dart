import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_rx/src/bloc/drawer_bloc.dart';
import 'package:flutter_architecture_rx/src/custom_widgets/drawer/items/list_item_drawer.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {

  final DrawerBloc drawerBloc;

  const CustomDrawer({Key key, this.drawerBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
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
             stream: drawerBloc.isClosed,
             builder: (context, snapshot) {
               return ListItemDrawer(
                 onPress:() {
                   /*drawerBloc.navigateTo(
                     page: nome da pagina,
                     context: context,
                     i: posicao
                   )*/
                   print('navegar');
                 },
                 isClosed: snapshot.data,
                 nome: 'Nome da pagina',
                 valor: -90,
                 comparativo: 0,
                 stream: drawerBloc.selected,
               );
             }
           ),
           StreamBuilder<bool>(
             stream: drawerBloc.isClosed,
             builder: (context, snapshot) {
               return ListItemDrawer(
                 isClosed: snapshot.data,
                 onPress:()  {
                   /*drawerBloc.navigateTo(
                     page: nome da pagina,
                     context: context,
                     i: posicao
                   )*/
                   print('navegar');
                 },
                 nome: 'Nome da pagina',
                 valor: 0,
                 comparativo: 1,
                 stream: drawerBloc.selected,
               );
             }
           ),
           StreamBuilder<bool>(
             stream: drawerBloc.isClosed,
             builder: (context, snapshot) {
               return ListItemDrawer(
                 isClosed: snapshot.data,
                 onPress:()  {
                   /*drawerBloc.navigateTo(
                     page: nome da pagina,
                     context: context,
                     i: posicao
                   )*/
                   print('navegar');
                 },
                 nome: 'Nome da pagina',
                 valor: 90,
                 comparativo: 2,
                 stream: drawerBloc.selected,
               );
             }
           )
          ],
        ),
      ),
    );
  }
}

