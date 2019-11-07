import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:tabcontroller_bug_test/src/pages/navegar_para.dart';

class SegundaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            color: Colors.green,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Text('Segunda tab Tab'),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          right: 30,
          child: GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(
               builder: (BuildContext context){
                 return NavegarParaPage();
               }
              )
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
              ),
              width: 50,
              height: 50,
              child: Center(
                child: Icon(Icons.add,color: Colors.green,),
              ),
            ),
          ),
        )

      ],

    );
  }
}