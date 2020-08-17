import 'package:cinema_scheduler/app/reminders/reminders_provider_model.dart';
import 'package:cinema_scheduler/app/watch_list/watch_list_provider_model.dart';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/models/app_models/details/details_model.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:flutter/cupertino.dart';

class DetailsProviderModel with ChangeNotifier {
  static const String ADDED_TO_WATCHLIST_NOTIFICATION_MESSAGE =
      "Added to watchlist";
  static const String REMOVED_FROM_WATCHLIST_NOTIFICATION_MESSAGE =
      "Removed from watchlist";
  static const String ADDED_TO_REMINDERS_NOTIFICATION_MESSAGE =
      "Added to reminders";
  static const String REMOVED_FROM_REMINDERS_NOTIFICATION_MESSAGE =
      "Removed from reminders";

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

    notificationService
        .showSuccessNotification(ADDED_TO_WATCHLIST_NOTIFICATION_MESSAGE);
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

    notificationService
        .showSuccessNotification(REMOVED_FROM_WATCHLIST_NOTIFICATION_MESSAGE);
  }

  Future onAddToRemindersFloatingActionButtonTapped({
    TitleModel titleModel,
    RemindersProviderModel remindersProvider,
  }) async {
    await remindersProvider.addToReminders(titleModel);

    isInReminders = true;

    notifyListeners();

    notificationService
        .showSuccessNotification(ADDED_TO_REMINDERS_NOTIFICATION_MESSAGE);
  }

  Future onRemoveFromRemindersFloatingActionButtonTapped({
    TitleModel titleModel,
    RemindersProviderModel remindersProvider,
  }) async {
    await remindersProvider.removeFromReminders(titleModel);

    isInReminders = false;

    notifyListeners();

    notificationService
        .showSuccessNotification(REMOVED_FROM_REMINDERS_NOTIFICATION_MESSAGE);
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
