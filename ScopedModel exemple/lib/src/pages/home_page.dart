import 'dart:io';

import 'package:example/src/custom_widgets/edit_text.dart';
import 'package:example/src/custom_widgets/list_item/palavra_list_item.dart';
import 'package:example/src/model/list_model.dart';
import 'package:example/src/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:device_info/device_info.dart';
import 'package:device_id/device_id.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage(this.title);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height:  100,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.only(left:16.0,right: 16,top: 16),
                  child: EditText(
                    controller: controller,
                    label: "Adicione uma palavra",
                    hint: "Adicione uma palavra",
                  )
              ),
            ),
            ScopedModelDescendant<ListStringModel>(
              builder: (context, child,listaModel){
                return listaModel.getLista == null || listaModel.getLista.length == 0 ?
                Center(
                  child: Text('Não há itens na lista'),
                )
                    :
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: listaModel.getLista.length,
                      itemBuilder: (context,index){
                        return PalavraListItem(
                          palavra: listaModel.getLista[index],
                        );
                      }
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton:
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ScopedModelDescendant<ListStringModel>(
            builder: (context, child, model) {
              return FloatingActionButton(
                onPressed: (){
                  model.addItemLista(controller.text);
                  getDeviceInfo();
                },
                tooltip: 'add',
                child: Icon(Icons.add),
              );
            },
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (context){
                return CounterPage();
                }
              )
            ),
            child: Icon(Icons.remove),
          )
        ],
      ),
      
      /*,*/
    );
  }

  void getDeviceInfo() async{
    String deviceName;
    String deviceVersion;
    String identifier;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();

    String device_id = await DeviceId.getID;

    if(Platform.isAndroid){
      var build = await deviceInfoPlugin.androidInfo;
      deviceName = build.model;
      deviceVersion = build.version.toString();
      identifier = build.androidId;//UUID
      print('informações do dispositivo');
      print(deviceName);
      print(deviceVersion);
      print(identifier);
    }else if(Platform.isIOS){
      print('RODANDO NO IOS');
        print(device_id);
    }

  }
}