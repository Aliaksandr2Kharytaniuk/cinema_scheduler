import 'package:cinema_scheduler/core/pages.dart';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/models/app_models/search/search_model.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:flutter/cupertino.dart';

class HomeProviderModel with ChangeNotifier {
  Future<SearchModel> searchDataFuture;
  bool isInLoading;

  void onSearchSubmitted(String value) {
    if (value.trim().isEmpty) {
      searchDataFuture = Future.value(null);
      notifyListeners();
    } else {
      searchDataFuture = _loadSearchResults(value);
    }
  }

  void onListViewItemTapped(TitleModel listViewItem) {
    navigationService.navigateTo(Pages.details, arguments: listViewItem);
  }

  Future<SearchModel> _loadSearchResults(String value) async {
    isInLoading = true;
    notifyListeners();

    final result = await searchRepository.loadSearchResults(searchQuery: value);

    isInLoading = false;
    notifyListeners();

    return result;
  }
}
