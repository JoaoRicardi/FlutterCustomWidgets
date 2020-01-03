import 'dart:async';
import 'dart:io';

import 'package:mobx/mobx.dart';

class TodoController{
  var todos = Observable([]);
  var todoItem = Observable('');
  var todoLoading = Observable(false);



  Action addTodo;

  TodoController() {
    addTodo = Action(_addTodo);
  }

  void _addTodo() async {
    todoLoading.value = true;
    var list = [];
    list.add(todoItem.value);
    todos.value = todos.value + list;
    todoLoading.value = false;


  }


}