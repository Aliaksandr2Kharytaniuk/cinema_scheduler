import 'package:cinema_scheduler/app/reminders/reminders_provider_model.dart';
import 'package:cinema_scheduler/app/watch_list/watch_list_provider_model.dart';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/models/app_models/details/details_model.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:flutter/cupertino.dart';

class DetailsProviderModel with ChangeNotifier {
  DetailsModel detailsModel;
  bool isInWatchlist;
  bool isInReminders;
  bool isInLoading;

  DetailsProviderModel(TitleModel titleModel) {
    _loadOverviewDetails(titleModel.id);
  }

  Future onAddToWatchlistFloatingActionButtonTapped({
    TitleModel titleModel,
    WatchlistProviderModel watchlistProvider,
  }) async {
    await watchlistProvider.addToWatchlist(titleModel);

    isInWatchlist = true;

    notifyListeners();
  }

  Future onRemoveFromWatchlistFloatingActionButtonTapped({
    TitleModel titleModel,
    WatchlistProviderModel watchlistProvider,
    RemindersProviderModel remindersProvider,
  }) async {
    await watchlistProvider.removeFromWatchlist(titleModel);
    await remindersProvider.removeFromReminders(titleModel);

    isInWatchlist = false;
    isInReminders = false;

    notifyListeners();
  }

  Future onAddToRemindersFloatingActionButtonTapped({
    TitleModel titleModel,
    RemindersProviderModel remindersProvider,
  }) async {
    await remindersProvider.addToReminders(titleModel);

    isInReminders = true;

    notifyListeners();
  }

  Future onRemoveFromRemindersFloatingActionButtonTapped({
    TitleModel titleModel,
    RemindersProviderModel remindersProvider,
  }) async {
    await remindersProvider.removeFromReminders(titleModel);

    isInReminders = false;

    notifyListeners();
  }

  Future _loadOverviewDetails(String titleId) async {
    isInLoading = true;
    notifyListeners();

    detailsModel = await detailsRepository.getDetails(titleId: titleId);
    isInWatchlist =
        await watchlistRepository.isItemWatchlisted(titleId: titleId);
    isInReminders = isInWatchlist &&
        await remindersRepository.isItemInReminders(titleId: titleId);

    isInLoading = false;
    notifyListeners();
  }
}
