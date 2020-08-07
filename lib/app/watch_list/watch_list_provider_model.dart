import 'package:cinema_scheduler/core/pages.dart';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:flutter/material.dart';

class WatchlistProviderModel with ChangeNotifier {
  List<TitleModel> watchlistCollection;
  bool isInLoading;
  bool isErrorOccurred;

  WatchlistProviderModel() {
    _loadWatchlistItems();
  }

  void onListViewItemTapped(TitleModel listViewItem) {
    navigationService.navigateTo(Pages.details, arguments: listViewItem);
  }

  Future addToWatchlist(TitleModel model) async {
    await watchlistRepository.add(model);
    _loadWatchlistItems();
  }

  Future removeFromWatchlist(TitleModel model) async {
    await watchlistRepository.remove(model);
    _loadWatchlistItems();
  }

  Future _loadWatchlistItems() async {
    isErrorOccurred = false;
    isInLoading = true;

    notifyListeners();

    try {
      watchlistCollection = await watchlistRepository.getWatchlist();
    } catch (error) {
      isErrorOccurred = true;
    } finally {
      isInLoading = false;
      notifyListeners();
    }
  }
}
