import 'package:cinema_scheduler/core/pages.dart';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/models/app_models/search/search_model.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:flutter/cupertino.dart';

class HomeProviderModel with ChangeNotifier {
  SearchModel searchResultModel;
  bool isInLoading;
  bool isErrorOccurred;

  HomeProviderModel() {
    isInLoading = false;
    isErrorOccurred = false;
  }

  Future onSearchSubmitted(String value) async {
    await _loadSearchResults(value);
  }

  void onListViewItemTapped(TitleModel listViewItem) {
    navigationService.navigateTo(Pages.details, arguments: listViewItem);
  }

  Future _loadSearchResults(String value) async {
    if (value.trim().isEmpty) {
      searchResultModel = null;
      notifyListeners();

      return;
    }

    isErrorOccurred = false;
    isInLoading = true;

    notifyListeners();

    try {
      searchResultModel =
          await searchRepository.loadSearchResults(searchQuery: value);
    } catch (error) {
      isErrorOccurred = true;
    } finally {
      isInLoading = false;
      notifyListeners();
    }
  }
}
