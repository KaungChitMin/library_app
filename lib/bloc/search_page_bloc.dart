import 'package:flutter/material.dart';
import 'package:library_book/data/apply/library_apply.dart';
import 'package:library_book/data/apply/library_apply_impl.dart';

import '../data/vos/search_vo/item_vo/item_vo.dart';

class SearchPageBloc extends ChangeNotifier {
  final LibraryApply _apply = LibraryApplyImpl();

  bool _dispose = false;

  List<ItemsVO>? _itemsList = [];
  String _query = '';
  List<String>? _searchQueryList = [];
  bool _isSearching = false;

  List<ItemsVO>? get getItemsList => _itemsList;

  List<String>? get getSearchQueryList => _searchQueryList;

  bool get getIsSearching => _isSearching;

  String get query => _query;

  SearchPageBloc() {
    ///Getting Search History list
    final historyList = _apply.getSearchHistoryList();

    if (historyList == null) {
      _searchQueryList = null;
    } else if (historyList.isEmpty) {
      _searchQueryList = [];
    } else {
      _searchQueryList = historyList;
      notifyListeners();
    }

    ///item list from network
    _apply.getItemListFromNetwork(query);

    ///listen item list from database
    _apply.getItemListFromDatabase().listen((event) {
      if (event != null) {
        _itemsList = event;
      } else if (event == null) {
        _itemsList = null;
      } else {
        _itemsList = [];
      }
    });
  }

  void saveQuery(String text) {
    _query = text;
    _isSearching = true;
    notifyListeners();
    _apply.getItemListFromNetwork(query).then((value) {
      if (value != null) {
        _itemsList = value;
        notifyListeners();
      }
    }).whenComplete(() {
      _isSearching = false;
      notifyListeners();
    });
  }

  void addQueryToSearchHistoryList(text) {
    _searchQueryList!.add(text);
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
