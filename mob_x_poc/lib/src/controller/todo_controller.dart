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

   print(todoItem.value);
   list.add(todoItem.value);

   todos.value = todos.value + list;

  }

}