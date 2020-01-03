import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mob_x_poc/src/controller/home_controller.dart';
import 'package:mob_x_poc/src/pages/todo_list_page.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MobX Poc'),
        ),
        body: Observer(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${homeController.counter.value}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom:16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TodoList()),
                  );
                },
                child: Icon(Icons.list,color: Colors.white,),
              ),
              SizedBox(width: 20,),
              FlatButton(
                color: Colors.blueAccent,
                onPressed: () => homeController.increment(),
                child: Icon(Icons.add,color: Colors.white,),
              ),
            ],
          ),
        )
    );
  }

}
