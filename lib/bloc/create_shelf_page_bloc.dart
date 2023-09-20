import 'package:flutter/material.dart';

import '../data/apply/library_apply.dart';
import '../data/apply/library_apply_impl.dart';
import '../data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import '../persistent/dao/shelf_dao/shelf_dao.dart';
import '../persistent/dao/shelf_dao/shelf_dao_impl.dart';

class CreateShelfPageBloc extends ChangeNotifier {
  ///state instance
  final LibraryApply _dataApply = LibraryApplyImpl();
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final ShelfDao _shelfDao = ShelfDaoImpl();


  ///state variable
  bool _isDispose = false;
  List<BooksVO> _bookList = [];


  ///getter
  TextEditingController get getTextEditingController => _textEditingController;

  GlobalKey<FormState> get getGlobalKey => _globalKey;

  List<BooksVO>? get getBookList => _bookList;


  void createShelfText() {
    var shelfName = _textEditingController.text.toString();
    _dataApply.createShelf(shelfName, []);
    notifyListeners();
  }

  void getBookListByShelfName(String shelfName) {
    var shelfVO = _shelfDao.getShelfName(shelfName);
    _bookList = shelfVO?.bookList ?? [];
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
