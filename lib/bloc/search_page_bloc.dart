import 'package:flutter/material.dart';
import 'package:library_book/data/apply/library_apply.dart';
import 'package:library_book/data/apply/library_apply_impl.dart';

import '../data/vos/search_vo/item_vo/item_vo.dart';

class SearchPageBloc extends ChangeNotifier {
  ///state instance
  final LibraryApply _apply = LibraryApplyImpl();
  TextEditingController _textEditingController = TextEditingController();

  ///state variable
  bool _dispose = false;
  bool _isSearching = false;
  String _query = ' ';
  String _history = ' ';
  List<ItemsVO>? _itemsList = [];
  List<String>? _searchHistoryList = [];

  ///getter
  String get getQuery => _query;

  String get getHistory => _history;

  bool get getIsSearching => _isSearching;

  List<ItemsVO>? get getItemsList => _itemsList;

  List<String>? get getSearchHistoryList => _searchHistoryList;

  TextEditingController get getTextEditingController => _textEditingController;

  ///bloc
  SearchPageBloc() {
    ///Getting Search History list
    List<String>? historyList = _apply.getSearchHistoryList();

    if (historyList == null) {
      _searchHistoryList = null;
    } else if (historyList.isEmpty) {
      _searchHistoryList = [];
    } else {
      _searchHistoryList = historyList;
    }
    notifyListeners();
    ///item list from network
    _apply.getItemListFromNetwork(getHistory);

    ///listen item list from database
    // _apply.getItemListFromDatabase().listen((event) {
    //   if (event != null) {
    //     _itemsList = event;
    //   } else if (event == null) {
    //     _itemsList = null;
    //   } else {
    //     _itemsList = [];
    //   }
    // });
  }

  void searchText(String text) {
    _history = text;
    _isSearching = true;
    notifyListeners();
    _apply.getItemListFromNetwork(getHistory).then((value) {
      if (value != null) {
        _itemsList = value;
        notifyListeners();
      }
    }).whenComplete(() {
      _isSearching = false;
      notifyListeners();
    });
  }

  void saveSearchHistory(text) {
    _apply.saveSearchHistory(text);
    notifyListeners();
  }

  void addQueryToSearchHistoryList(text) {
    _query = text;
    _textEditingController = TextEditingController(text: _query);
    searchText(text);
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
