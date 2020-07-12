import 'package:cinema_scheduler/app/details/details_provider_model.dart';
import 'package:cinema_scheduler/app/home/home_provider_model.dart';
import 'package:cinema_scheduler/app/shell/shell_page.dart';
import 'package:cinema_scheduler/app/shell/shell_provider_model.dart';
import 'package:cinema_scheduler/core/dependences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShellProviderModel()),
        ChangeNotifierProvider(create: (_) => HomeProviderModel()),
        ChangeNotifierProvider(create: (_) => DetailsProviderModel()),
      ],
      child: MaterialApp(
        title: _materialAppTitle,
        navigatorKey: navigationService.navigatorKey,
        home: ShellPage(),
      )
    );
  }
}
