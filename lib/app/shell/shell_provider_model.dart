import 'package:cinema_scheduler/core/pages.dart';
import 'package:flutter/cupertino.dart';

class ShellProviderModel with ChangeNotifier {
  int selectedPageIndex = 0;
  
  final List<Pages> pages = [
    Pages.home,
    Pages.watch_list,
    Pages.reminders,
    Pages.more,
  ];

  void onPageItemTapped(int index) {
    selectedPageIndex = index;
    notifyListeners();
  }
}
