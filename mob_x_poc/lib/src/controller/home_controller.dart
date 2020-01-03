import 'package:mobx/mobx.dart';

class HomeController {

  var counter = Observable(0);
  Action increment;

  HomeController(){
    increment = Action(_increment);
  }

  _increment() {
    counter.value = counter.value + 1;
  }

}