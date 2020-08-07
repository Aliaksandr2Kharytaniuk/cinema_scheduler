import 'package:cinema_scheduler/core/pages.dart';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:flutter/material.dart';

class RemindersProviderModel with ChangeNotifier {
  List<TitleModel> remindersCollection;
  bool isInLoading;
  bool isErrorOccurred;

  RemindersProviderModel() {
    _loadRemindersItems();
  }

  void onListViewItemTapped(TitleModel listViewItem) {
    navigationService.navigateTo(Pages.details, arguments: listViewItem);
  }

  Future addToReminders(TitleModel model) async {
    await remindersRepository.add(model);
    _loadRemindersItems();
  }

  Future removeFromReminders(TitleModel model) async {
    await remindersRepository.remove(model);
    _loadRemindersItems();
  }

  Future _loadRemindersItems() async {
    isErrorOccurred = false;
    isInLoading = true;

    notifyListeners();

    try {
      remindersCollection = await remindersRepository.getReminders();
    } catch (error) {
      isErrorOccurred = true;
    } finally {
      isInLoading = false;
      notifyListeners();
    }
  }
}
