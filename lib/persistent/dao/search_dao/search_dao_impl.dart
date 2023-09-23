import 'package:hive/hive.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/persistent/dao/search_dao/search_dao.dart';

class SearchDaoImpl extends SearchDao {
  SearchDaoImpl._();

  static final SearchDaoImpl _singleton = SearchDaoImpl._();

  factory SearchDaoImpl() => _singleton;

  @override
  void save(String query) {
    _getSearchBox().put(DateTime.now().toString(), query);
  }

  @override
  List<String>? getSearchStringList() => _getSearchBox().values.toList();

  Box<String> _getSearchBox() => Hive.box<String>(kBoxNameForSearchHistoryVO);
}

