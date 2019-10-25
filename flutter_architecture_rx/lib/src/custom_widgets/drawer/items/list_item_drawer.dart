import 'package:flutter/material.dart';
import 'package:flutter_architecture_rx/src/values/colors.dart' as colors;


class ListItemDrawer extends StatelessWidget {

 final String nome;
 final int valor;
 final bool isClosed;
 final Function onPress;
 final int comparativo;
 final Stream stream;

 ListItemDrawer({ this.nome, this.valor,this.stream,this.isClosed,this.onPress,this.comparativo});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration:Duration(milliseconds: 400),
      left: isClosed == true  ? -200 : -2,
      top: isClosed == true ? 60 :MediaQuery.of(context).size.height/2 +valor,
      child: InkWell(
        onTap: onPress,
        child: StreamBuilder<int>(
          stream: stream,
          builder: (context, snapshot) {
            return Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: snapshot.data == comparativo ? colors.accentColor : Colors.transparent
                )
              ),
              child: Padding(
                padding: EdgeInsets.only(left:16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(nome,
                      style: TextStyle(          
                      fontFamily: 'NotoSerif',
                      color: colors.accentColor,
                      fontSize: 32
                      )
                    ), 
                  ],
                ),
              )            
            );
          }
        ),
      ), 
    );
  }
}
