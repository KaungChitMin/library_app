import 'package:flutter/foundation.dart';
import 'package:library_book/data/apply/library_apply.dart';
import 'package:library_book/data/apply/library_apply_impl.dart';

import '../data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import '../data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import '../persistent/dao/lists_dao/lists_dao_impl.dart';

class HomePageBloc extends ChangeNotifier {
  final LibraryApply _apply = LibraryApplyImpl();
  final ListsDaoImpl _listsDao = ListsDaoImpl();

  ///state variable
  bool _dispose = false;
  List<ListsVO>? _listsVoList = [];
  List<BooksVO>? _bookList = [];

  ///getter
  List<ListsVO>? get getListsVoList => _listsVoList;

  List<BooksVO>? get getBooksList => _bookList;

  HomePageBloc(String publishDate) {
    ///clear book box
    _apply.clearBookBox();

    ///results vo from network
    _apply.getResultsFromNetWork(publishDate);

    ///listen book list from database
    _apply.getBookFromDatabaseStream().listen((event) {
      if (event != null) {
        _bookList = event;
      } else if (event!.isEmpty) {
        _bookList = [];
      } else {
        _bookList = null;
      }
      notifyListeners();
    });

    ///listen results on database by publish date
    _apply.getResultsFromDataBase(publishDate).listen((event) {
      if (event != null) {
        _listsVoList = event.lists;
      } else if (event == null) {
        _listsVoList = null;
      } else {
        _listsVoList = [];
      }
      notifyListeners();
    });
  }

  // void checkFavourite(String mainTitle, BooksVO booksVO) {
  //   final favouriteList = _listsDao.getListsBox.get(mainTitle);
  //   if (favouriteList != null) {
  //     var favoriteBook = favouriteList.books;
  //
  //     if (favoriteBook != null) {
  //       for (var value in favoriteBook) {
  //         if (value.title == booksVO.title) {
  //           value.isSelected = true;
  //         } else {
  //           value.isSelected = false;
  //         }
  //       }
  //       _listsDao.save(_listsVoList!);
  //     }
  //   }
  // }
  void checkFavourite(String mainTitle, BooksVO booksVO) {
    final listNameInListVO = _listsDao.getListsBox.get(mainTitle);
    if (listNameInListVO != null) {
      List<BooksVO> favouriteBooksList = listNameInListVO.books ?? [];
      for (var favouriteBook in favouriteBooksList) {
        if (favouriteBook.title == booksVO.title) {
          favouriteBook.isSelected = !(favouriteBook.isSelected ?? false);
        }
      }
      _listsDao.save(_listsVoList!);
    }
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
