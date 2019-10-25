import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
class BlocBase with ChangeNotifier {
  final _loading = BehaviorSubject<bool>.seeded(false);

  Observable<bool> get loading => _loading.stream;
  void setLoading(bool status) => _loading.sink.add(status);


  @override
  void dispose() {
    _loading.close();
    super.dispose();
  }
}