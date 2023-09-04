import 'package:flutter/foundation.dart';
import 'package:library_book/data/apply/library_apply.dart';
import 'package:library_book/data/apply/library_apply_impl.dart';

import '../data/vos/home_page_vo/results_vo/lists_vo.dart';

class HomePageBloc extends ChangeNotifier {
  final LibraryApply _apply = LibraryApplyImpl();

  ///state variable
  bool _dispose = false;
  List<ListsVO>? _listsVoList = [];

  ///getter

  List<ListsVO>? get getListsVoList => _listsVoList;

  HomePageBloc(String publishDate) {
    ///results vo from network
    _apply.getResultsFromNetWork(publishDate);

    ///listen results on database by publish date
    _apply.getResultsFromDataBase(publishDate).listen((event) {
      if (event != null) {
        _listsVoList = event.lists;
      }
      notifyListeners();
    });
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
