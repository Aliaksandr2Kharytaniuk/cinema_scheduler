import 'package:cinema_scheduler/core/dependences.dart';
import 'package:cinema_scheduler/core/pages.dart';
import 'package:cinema_scheduler/data/models/app_models/search/search_model.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:flutter/cupertino.dart';

class HomeProviderModel with ChangeNotifier {
  Future<SearchModel> searchDataFuture;

  void onSearchSubmitted(String value) {
    searchDataFuture = loadSearchResults(value);
    notifyListeners();
  }

  void onListViewItemTapped(TitleModel listViewItem) {
    navigationService.navigateTo(Pages.details, arguments: listViewItem);
  }

  Future<SearchModel> loadSearchResults(String value) async {
    return await searchRepository.loadSearchResults(searchQuery: value);
  }
}
