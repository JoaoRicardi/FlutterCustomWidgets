
import 'package:flutter/material.dart';
import 'package:flutter_architecture_rx/src/custom_widgets/text.dart';

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Flutter Base'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 100,
          child: CustomText(
            color: Colors.black,
            text: "Este projeto serve como arquitetura base para projetos maiores alem de guardar custom components basicos que permitem a reutilizacao",
          ),
        )
      ),
    );
  }
}