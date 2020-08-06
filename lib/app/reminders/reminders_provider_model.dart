import 'package:cinema_scheduler/core/pages.dart';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:flutter/material.dart';

class RemindersProviderModel with ChangeNotifier {
  Future<List<TitleModel>> remindersDataFuture;
  bool isInLoading;

  RemindersProviderModel() {
    _setRemindersDataFuture();
  }

  void onListViewItemTapped(TitleModel listViewItem) {
    navigationService.navigateTo(Pages.details, arguments: listViewItem);
  }

  Future addToReminders(TitleModel model) async {
    await remindersRepository.add(model);
    _setRemindersDataFuture();
  }

  Future removeFromReminders(TitleModel model) async {
    await remindersRepository.remove(model);
    _setRemindersDataFuture();
  }

  void _setRemindersDataFuture() {
    remindersDataFuture = _loadRemindersItems();
  }

  Future<List<TitleModel>> _loadRemindersItems() async {
    isInLoading = true;
    notifyListeners();

    var result = await remindersRepository.getReminders();

    isInLoading = false;
    notifyListeners();

    return result;
  }
}
