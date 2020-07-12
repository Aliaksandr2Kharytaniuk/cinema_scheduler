import 'package:cinema_scheduler/core/dependences.dart';
import 'package:cinema_scheduler/core/pages.dart';
import 'package:cinema_scheduler/data/models/search/search_data.dart';
import 'package:cinema_scheduler/data/models/title/title_data.dart';
import 'package:flutter/cupertino.dart';

class HomeProviderModel with ChangeNotifier {
  Future<SearchData> searchDataFuture;

  void onSearchSubmitted(String value) {
    searchDataFuture = loadSearchResults(value);
    notifyListeners();
  }

  void onListViewItemTapped(TitleData listViewItem) {
    navigationService.navigateTo(Pages.details, arguments: listViewItem);
  }

  Future<SearchData> loadSearchResults(String value) async {
    return await searchRepository.loadSearchResults(searchQuery: value);
  }
}