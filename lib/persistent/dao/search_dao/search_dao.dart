// abstract class SearchDao {
//   void save(String query);
//
//   List<String>? getSearchStringList();
// }

abstract class SearchDao {
  void save(String query);

  List<String>? getSearchHistory();
}