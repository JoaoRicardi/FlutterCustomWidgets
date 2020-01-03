import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mob_x_poc/src/controller/todo_controller.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final todoController  = TodoController();
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo list'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                editTextInput(controller: controller,todoController: todoController),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child:todoController.todoLoading.value == true
                        ?
                    Center(
                      child: CircularProgressIndicator(
                      ),
                    )
                        :
                    ListView.builder(
                        itemCount: todoController.todos.value.length,
                        itemBuilder: (context, index){
                          final obj = todoController.todos.value[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 90,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Center(
                                child: Text('$obj'),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text('Add todo item'),
                        onPressed: (){
                          todoController.addTodo();
                          controller.text= '';
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${todoController.todos.value.length}')
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget editTextInput({TextEditingController controller,TodoController todoController}) {
    return  TextField(
      controller: controller,
      onChanged: (value) {
        todoController.todoItem.value = value;
      },
      maxLines: 1,
      decoration: InputDecoration(
          labelText: 'add todo item',
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(
              color: Colors.black
          ),
          border:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 0
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 1
              )

          )
      ),
      style: TextStyle(color: Colors.black),
    );
  }
}
