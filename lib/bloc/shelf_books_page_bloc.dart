import 'package:flutter/material.dart';
import 'package:library_book/data/apply/library_apply.dart';
import 'package:library_book/data/apply/library_apply_impl.dart';
import 'package:library_book/data/vos/home_page_vo/shelf_vo/shelf_vo.dart';
import 'package:library_book/persistent/dao/shelf_dao/shelf_dao_impl.dart';

import '../data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';

class ShelfPageBloc extends ChangeNotifier {
  ///state instance
  final LibraryApply _apply = LibraryApplyImpl();
  final ShelfDaoImpl _shelfDaoImpl = ShelfDaoImpl();

  ///state variable
  bool _dispose = false;
  List<ShelfVO>? _shelfList = [];

  List<ShelfVO>? get getShelfList => _shelfList;

  ShelfPageBloc(BooksVO booksVO) {
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

// import 'package:flutter/material.dart';
//
// import '../data/apply/library_apply.dart';
// import '../data/apply/library_apply_impl.dart';
// import '../data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
// import '../data/vos/home_page_vo/shelf_vo/shelf_vo.dart';
// import '../persistent/dao/shelf_dao/shelf_dao_impl.dart';
//
// class ShelfPageBloc extends ChangeNotifier{
//
//   // state variable
//   bool _isDispose = false;
//   List<ShelfVO>? _shelfList;
//
//
//   // getter
//   List<ShelfVO>? get getShelfList => _shelfList;
//
//   // state instance
//   final LibraryApply _dataApply = LibraryApplyImpl();
//   final ShelfDaoImpl _shelfDAOImpl = ShelfDaoImpl();
//
//
//   ShelfPageBloc(BooksVO books){
//     _dataApply.getShelfVOFromDatabase().listen((event) {
//       _shelfList = event ?? [];
//       notifyListeners();
//     });
//
//   }
//
//
//   void addBooksToShelf(ShelfVO shelfVO,BooksVO books){
//     shelfVO.bookList.add(books);
//     _shelfDAOImpl.saveShelf(shelfVO);
//     notifyListeners();
//   }
//
//   @override
//   void notifyListeners() {
//     // TODO: implement notifyListeners
//     if(!_isDispose){
//       super.notifyListeners();
//     }
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _isDispose = true;
//   }
// }
