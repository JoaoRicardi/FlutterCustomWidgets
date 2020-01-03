import 'package:flutter/material.dart';
import 'package:mob_x_poc/src/pages/home_page.dart';
import 'package:mob_x_poc/src/pages/todo_list_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage()
      /*Todo
      todo para realizar os testes ainda é preciso alter de MyHomepage para TodoList
      todo estou vendo como resolver isso pois, aparentemente o scaffold é depende de um contett que é passado
      todo pelo MaterialApp jaja mudou ; )
      */
    );
  }
}

