import 'package:flutter/material.dart';
import 'package:library_book/data/apply/library_apply.dart';
import 'package:library_book/data/apply/library_apply_impl.dart';
import 'package:library_book/data/vos/home_page_vo/shelf_vo/shelf_vo.dart';
import 'package:library_book/persistent/dao/shelf_dao/shelf_dao.dart';
import 'package:library_book/persistent/dao/shelf_dao/shelf_dao_impl.dart';

import '../data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';

class ShelfBooksPageBloc extends ChangeNotifier {
  ///state instance
  final LibraryApply _apply = LibraryApplyImpl();
  final ShelfDaoImpl _shelfDaoImpl = ShelfDaoImpl();
  final ShelfDao _shelfDao = ShelfDaoImpl();

  ///state variable
  bool _dispose = false;
  List<ShelfVO>? _shelfList = [];
  List<BooksVO> _bookList = [];

  ///getter
  List<ShelfVO>? get getShelfList => _shelfList;

  List<BooksVO>? get getBookList => _bookList;

  ///bloc
  ShelfBooksPageBloc(BooksVO booksVO) {
    ///listen Shelf List From Database
    _apply.getShelfVOFromDatabase().listen((event) {
      if (event != null) {
        _shelfList = event;
      } else if (event == null) {
        _shelfList = null;
      } else {
        _shelfList = [];
      }
      notifyListeners();
    });
  }

  void addBooksToShelf(ShelfVO shelfVO, BooksVO booksVO) {
    shelfVO.bookList.add(booksVO);
    _shelfDaoImpl.saveShelf(shelfVO);
    notifyListeners();
  }

  void getBookListByShelfName(String shelfName) {
    var shelfVO = _shelfDao.getShelfName(shelfName);
    _bookList = shelfVO?.bookList ?? [];
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
