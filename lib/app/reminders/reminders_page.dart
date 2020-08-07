import 'package:cinema_scheduler/app/common/general_page_error_widget.dart';
import 'package:cinema_scheduler/app/common/movies_listview/movies_listview_widget.dart';
import 'package:cinema_scheduler/app/reminders/reminders_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemindersPage extends StatefulWidget {
  @override
  _RemindersPageState createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  static const String EMPTY_LIST_VIEW_TEXT =
      "You have no reminders\nOpen any watchlisted movie to add them!";
  static const String LIST_VIEW_ERROR_TEXT = "Ooops! Some error has occurred";

  @override
  Widget build(BuildContext context) {
    return Consumer<RemindersProviderModel>(
      builder: (context, RemindersProviderModel provider, child) {
        return _buildPage(provider);
      },
    );
  }

  Widget _buildPage(RemindersProviderModel provider) {
    if (provider.isInLoading == true) {
      return _buildDataLoadingWidget();
    }

    if (provider.isErrorOccurred == true) {
      return _buildDataErrorWidget();
    }

    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: _buildListViewWidget(provider),
    );
  }

  Widget _buildListViewWidget(RemindersProviderModel provider) {
    return MoviesListViewWidget(
      items: provider.remindersCollection,
      emptyListViewIconData: Icons.notifications,
      emptyListViewText: EMPTY_LIST_VIEW_TEXT,
      onItemTappedFunction: provider.onListViewItemTapped,
    );
  }

  Widget _buildDataLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildDataErrorWidget() {
    return GeneralPageErrorWidget();
  }
}
