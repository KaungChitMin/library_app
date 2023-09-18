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

  ///getter
  List<ListsVO>? get getListsVoList => _listsVoList;

  ///Bloc
  HomePageBloc(String publishDate) {
    ///getting lists from network
    _apply.getListsListFromNetwork(publishDate);

    ///listen lists vo list on database
    _apply.getListsFromDataBase().listen((event) {
      if (event != null && event.isNotEmpty) {
        _listsVoList = event;
      }
      notifyListeners();
    });
  }

  ///changing favourite icon when book title same
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
