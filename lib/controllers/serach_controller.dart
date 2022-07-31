import 'package:get/get.dart';

class SearchController extends GetxController {
  List<String> recentSearches = ['Search 1', 'Search 2', 'Search 3'];
  List<String> popularSearches = ['Search 1', 'Search 2', 'Search 3'];

  void removeRecentSearch(String search) {
    recentSearches.remove(search);
    update();
  }

  void removePopularSearch(String search) {
    popularSearches.remove(search);
    update();
  }
}
