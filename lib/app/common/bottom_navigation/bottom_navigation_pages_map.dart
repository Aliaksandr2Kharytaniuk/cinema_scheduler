import 'package:cinema_scheduler/core/pages.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_item_model.dart';

const HOME_PAGE_TITLE = "Home";
const WATCH_LIST_PAGE_TITLE = "Watch list";
const REMINDERS_PAGE_TITLE = "Reminders";
const MORE_PAGE_TITLE = "More";

final Map<Pages, BottomNavigationItemModel> bottomNavigationPagesMap = {
  Pages.home: BottomNavigationItemModel(icon: Icons.home, title: HOME_PAGE_TITLE),
  Pages.watch_list: BottomNavigationItemModel(icon: Icons.list, title: WATCH_LIST_PAGE_TITLE),
  Pages.reminders: BottomNavigationItemModel(icon: Icons.notifications, title: REMINDERS_PAGE_TITLE),
  Pages.more: BottomNavigationItemModel(icon: Icons.menu, title: MORE_PAGE_TITLE),
};