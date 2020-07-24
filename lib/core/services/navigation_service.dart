import 'package:cinema_scheduler/app/shell/shell_page.dart';
import 'package:cinema_scheduler/app/details/details_page.dart';
import 'package:cinema_scheduler/core/pages.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future<dynamic> navigateTo(Pages page, {Object arguments}) {
    final route = _generateRoute(page, arguments);
    return navigatorKey.currentState.push(route);
  }

  Future<dynamic> navigateWithReplacementTo(Pages page, {Object arguments}) {
    final route = _generateRoute(page, arguments);
    return navigatorKey.currentState.pushReplacement(route);
  }

  void goBack() {
    navigatorKey.currentState.pop();
  }

  Route<dynamic> _generateRoute(Pages page, Object arguments) {
    Widget resultPage;
    RouteSettings settings;

    switch (page) {
      case Pages.shell:
        resultPage = ShellPage();
        break;
      case Pages.home:
        resultPage = ShellPage();
        break;
      case Pages.watch_list:
        resultPage = ShellPage();
        break;
      case Pages.reminders:
        resultPage = ShellPage();
        break;
      case Pages.more:
        resultPage = ShellPage();
        break;
      case Pages.details:
        resultPage = DetailsPage(titleModel: arguments as TitleModel);
        break;
      default:
        resultPage = ShellPage();
        break;
    }

    return _getRoute(resultPage, settings: settings);
  }

  Route<dynamic> _getRoute(Widget widget, {RouteSettings settings}) {
    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }
}
