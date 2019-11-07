import 'package:flutter/material.dart';

class NavegarParaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Navegar para page'),
      ),
      body: Center(
        child: Text('Navegar para page'),
      ),
    );
  }
}
