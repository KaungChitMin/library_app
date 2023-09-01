import 'package:flutter/cupertino.dart';

class BottomNavigationPageBloc extends ChangeNotifier {
  bool _dispose = false;

  int _index = 0;

  int get getIndex => _index;

  void pageChange(int index) {
    _index = index;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}
