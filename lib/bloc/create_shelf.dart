import 'package:flutter/material.dart';

import '../data/apply/library_apply.dart';
import '../data/apply/library_apply_impl.dart';

class CreateShelfPageBloc extends ChangeNotifier {
  ///state instance
  final LibraryApply _dataApply = LibraryApplyImpl();
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  ///state variable
  bool _isDispose = false;

  ///getter
  TextEditingController get getTextEditingController => _textEditingController;

  GlobalKey<FormState> get getGlobalKey => _globalKey;

  void createShelfText() {
    var shelfName = _textEditingController.text.toString();
    _dataApply.createShelf(shelfName, []);
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!_isDispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _isDispose = true;
  }
}
