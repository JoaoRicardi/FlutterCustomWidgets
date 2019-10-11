import 'package:flutter/material.dart';
import 'package:device_calendar/device_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

 

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                       
            FlatButton(
              color: Colors.blue,
              child: Text("pedir permissao"),
              onPressed: () {
                DeviceCalendarPlugin().requestPermissions(                  
                );               
              }                
            ),
            FlatButton(
              color: Colors.blue,
              child: Text("add evento"),
              onPressed: () {
                DeviceCalendarPlugin().createOrUpdateEvent(       
                  Event(
                    "meu calendario",
                    start: DateTime.now(),
                    end: DateTime.now().add(Duration(days: 1)),
                    description: "é uma descricao teste",
                    eventId:"evento id teste",
                    title: "este é um titulo teste"


                  ),           
                );               
              }                
            ),

            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
