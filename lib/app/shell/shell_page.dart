import 'package:cinema_scheduler/app/common/bottom_navigation/bottom_navigation_widget.dart';
import 'package:cinema_scheduler/app/home/home_page.dart';
import 'package:cinema_scheduler/app/more/more_page.dart';
import 'package:cinema_scheduler/app/reminders/reminders_page.dart';
import 'package:cinema_scheduler/app/shell/shell_provider_model.dart';
import 'package:cinema_scheduler/app/watch_list/watch_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShellPage extends StatefulWidget {
  @override
  _ShellPageState createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  static const String SCAFOLD_TITLE = "Cinema scheduler";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShellProviderModel(),
      child: Consumer<ShellProviderModel>(
        builder: (context, ShellProviderModel provider, child) {
          return _buildPage(context, provider);
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, ShellProviderModel provider) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SCAFOLD_TITLE),
      ),
      body: IndexedStack(
        index: provider.selectedPageIndex,
        children: <Widget>[
          HomePage(),
          WatchListPage(),
          RemindersPage(),
          MorePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationWidget(
        pages: provider.pages,
        selectedIndex: provider.selectedPageIndex,
        onTappedFunction: provider.onPageItemTapped,
      ),
    );
  }
}
