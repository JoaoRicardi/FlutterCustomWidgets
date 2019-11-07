import 'package:example/src/model/list_model.dart';
import 'package:example/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScopedModel<ListStringModel>(
      model: new ListStringModel(),
      child: MaterialApp(
        title: 'Scoped Model Exemple',
        home: HomePage('Scoped Model Exemple'),
      ),
    );
  }
}