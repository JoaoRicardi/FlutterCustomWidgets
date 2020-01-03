import 'package:mobx/mobx.dart';

class TodoController{
  var todos = Observable([]);
  var todoItem = Observable('');

  Action addTodo;

  TodoController() {
    addTodo = Action(_addTodo);
  }

  void _addTodo() {
   var list = [];

   list.add(todoItem.value);

   todos.value = todos.value + list;

  }

}