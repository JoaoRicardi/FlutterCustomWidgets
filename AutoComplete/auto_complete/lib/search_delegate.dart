import 'package:flutter/material.dart';

//o tipo que voce colocar no delegate sera seu retorno da litsa

class ListDelgate extends SearchDelegate<String>{

  //TODO
  //Se quiser filtrar alguma lista mandar ela como parametro
  // final List<items> listaParaFiltrar;

  //ListDelgate({}this.listaParaFiltrar)



  @override
  List<Widget> buildActions(BuildContext context) {
    //Icones que terao como acao
    return [
      IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            query = '';
          }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){
          close(context, '');
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //Colocar oque vai aparecer como resultado no final da busca
    //quando ele der ok

    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
//Colocar oque vai aparecer como sugestao para o cara
    return Text(query);
  }



}