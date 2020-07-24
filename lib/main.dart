import 'package:cinema_scheduler/app/decorations/theme_provider.dart';
import 'package:cinema_scheduler/app/shell/shell_page.dart';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:flutter/material.dart';

void main() {
  DependencyService.registerDependencies();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  static const String _materialAppTitle = "Cinema scheduller application";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _materialAppTitle,
      navigatorKey: navigationService.navigatorKey,
      home: ShellPage(),
      theme: ThemeProvider.getTheme(context),
    );
  }
}
