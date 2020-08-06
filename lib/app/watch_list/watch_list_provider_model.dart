import 'package:cinema_scheduler/core/pages.dart';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:flutter/material.dart';

class WatchlistProviderModel with ChangeNotifier {
  Future<List<TitleModel>> watchlistDataFuture;
  bool isInLoading;

  WatchlistProviderModel() {
    _setWatchlistDataFuture();
  }

  void onListViewItemTapped(TitleModel listViewItem) {
    navigationService.navigateTo(Pages.details, arguments: listViewItem);
  }

  Future addToWatchlist(TitleModel model) async {
    await watchlistRepository.add(model);
    _setWatchlistDataFuture();
  }

  Future removeFromWatchlist(TitleModel model) async {
    await watchlistRepository.remove(model);
    _setWatchlistDataFuture();
  }

  void _setWatchlistDataFuture() {
    watchlistDataFuture = _loadWatchlistItems();
  }

  Future<List<TitleModel>> _loadWatchlistItems() async {
    isInLoading = true;
    notifyListeners();

    var result = await watchlistRepository.getWatchlist();

    isInLoading = false;
    notifyListeners();

    return result;
  }
}
