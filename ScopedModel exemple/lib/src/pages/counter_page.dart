import 'package:example/src/model/list_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CounterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ListStringModel model = ScopedModel.of<ListStringModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
    );
  }
}
