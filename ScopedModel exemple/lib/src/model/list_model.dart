import 'package:scoped_model/scoped_model.dart';

class ListStringModel extends Model{

  List<String> _lista = [];

  List<String> get getLista => _lista;

  void addItemLista(String value){
     _lista.add(value);
     notifyListeners();
  }

  int getListSize(){
    return _lista.length;

  }


}