import 'package:flutter/cupertino.dart';
import 'package:library_book/data/apply/library_apply.dart';
import 'package:library_book/data/apply/library_apply_impl.dart';
import 'package:library_book/persistent/dao/lists_dao/lists_dao_impl.dart';

import '../data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import '../data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';

class FavouritePageBloc extends ChangeNotifier {
  final LibraryApply _apply = LibraryApplyImpl();
  final ListsDaoImpl _listsDao = ListsDaoImpl();

  bool _dispose = false;
  List<ListsVO>? _favouriteList = [];

  List<ListsVO>? get getFavouriteList => _favouriteList;

  FavouritePageBloc() {
    _apply.getListsFromDataBase().listen((event) {
      if (event != null) {
        _favouriteList = event;
        notifyListeners();
      }
      notifyListeners();
    });
  }

  void checkFavourite(String mainTitle, BooksVO booksVO) {
    final favouriteList = _listsDao.getListsBox.get(mainTitle);
    if (favouriteList != null) {
      List<BooksVO> favouriteBooks = favouriteList.books ?? [];
      for (var favouriteBook in favouriteBooks) {
        if (favouriteBook.title == booksVO.title) {
          favouriteBook.isSelected = !(favouriteBook.isSelected ?? false);
        }
      }
      _listsDao.save(_favouriteList!);
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
