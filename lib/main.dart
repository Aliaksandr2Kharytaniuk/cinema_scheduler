import 'package:cinema_scheduler/app/decorations/theme_provider.dart';
import 'package:cinema_scheduler/app/home/home_provider_model.dart';
import 'package:cinema_scheduler/app/reminders/reminders_provider_model.dart';
import 'package:cinema_scheduler/app/shell/shell_provider_model.dart';
import 'package:cinema_scheduler/app/watch_list/watch_list_provider_model.dart';
import 'package:cinema_scheduler/app/decorations/assets.dart';
import 'package:cinema_scheduler/core/pages.dart';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  DependencyService.registerDependencies();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  static const String MATERIAL_APP_TITLE = "Cinema scheduller application";
  static const String START_ANIMATION_KEY = "loading";

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShellProviderModel()),
        ChangeNotifierProvider(create: (_) => HomeProviderModel()),
        ChangeNotifierProvider(create: (_) => WatchlistProviderModel()),
        ChangeNotifierProvider(create: (_) => RemindersProviderModel()),
      ],
      child: MaterialApp(
        title: MATERIAL_APP_TITLE,
        navigatorKey: navigationService.navigatorKey,
        home: SplashScreen.callback(
          name: Assets.SPLASH_LOADER,
          onSuccess: (_) =>
              navigationService.navigateWithReplacementTo(Pages.shell),
          onError: null,
          until: () => Future.delayed(const Duration()),
          startAnimation: START_ANIMATION_KEY,
          backgroundColor:
              ThemeProvider.getTheme(context).scaffoldBackgroundColor,
        ),
        theme: ThemeProvider.getTheme(context),
      ),
    );
  }
}
