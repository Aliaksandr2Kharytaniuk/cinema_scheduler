import 'package:cinema_scheduler/core/defines/pages_defines.dart';
import 'package:cinema_scheduler/core/pages.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_item_model.dart';

final Map<Pages, BottomNavigationItemModel> bottomNavigationPagesMap = {
  Pages.home: BottomNavigationItemModel(
      icon: Icons.home, title: PagesDefines.HOME_PAGE_SECOND_TITLE),
  Pages.watch_list: BottomNavigationItemModel(
      icon: Icons.list, title: PagesDefines.WATCH_LIST_PAGE_TITLE),
  Pages.reminders: BottomNavigationItemModel(
      icon: Icons.notifications, title: PagesDefines.REMINDERS_PAGE_TITLE),
  Pages.more: BottomNavigationItemModel(
      icon: Icons.menu, title: PagesDefines.MORE_PAGE_TITLE),
};
