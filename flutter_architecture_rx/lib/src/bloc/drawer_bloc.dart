import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_rx/src/bloc/bloc_base/bloc_base.dart';
import 'package:flutter_architecture_rx/src/helpers/navigation/nav_slide_from_right.dart';
import 'package:rxdart/rxdart.dart';

class DrawerBloc extends BlocBase {

  final _isClosed = BehaviorSubject<bool>.seeded(true);
  Observable<bool>get isClosed => _isClosed.stream;
  void toggle(){
    _isClosed.sink.add(!_isClosed.value);
  }

  final _selected = BehaviorSubject<int>.seeded(0);
  Observable<int>get selected => _selected.stream;

  void setSelected(int i){
    _selected.sink.add(i);
  }

  void navigateTo({Widget page,int i,BuildContext context}){
    toggle();
    setSelected(i);
    Navigator.push(context, NavSlideFromRight(
      page: page
    ));
  }


  @override
  void dispose() {
    _isClosed.close();
    _selected.close();
    super.dispose();
  }

}