import 'package:cinema_scheduler/core/defines/pages_defines.dart';
import 'package:cinema_scheduler/core/pages.dart';
import 'package:flutter/cupertino.dart';

class ShellProviderModel with ChangeNotifier {
  int selectedPageIndex = 0;
  String pageTitle;

  final List<Pages> pages = [
    Pages.home,
    Pages.watch_list,
    Pages.reminders,
    Pages.more,
  ];

  final Map<Pages, String> applicationPagesMap = {
    Pages.home: PagesDefines.HOME_PAGE_TITLE,
    Pages.watch_list: PagesDefines.WATCH_LIST_PAGE_TITLE,
    Pages.reminders: PagesDefines.REMINDERS_PAGE_TITLE,
    Pages.more: PagesDefines.MORE_PAGE_TITLE,
  };

  ShellProviderModel() {
    pageTitle = applicationPagesMap[pages[selectedPageIndex]];
    notifyListeners();
  }

  void onPageItemTapped(int index) {
    selectedPageIndex = index;
    pageTitle = applicationPagesMap[pages[selectedPageIndex]];

    notifyListeners();
  }
}
