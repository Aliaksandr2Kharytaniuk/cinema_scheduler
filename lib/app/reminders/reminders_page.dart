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
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: _buildContentWidget(provider),
    );
  }

  Widget _buildContentWidget(RemindersProviderModel provider) {
    return FutureBuilder(
      future: provider.remindersDataFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _buildDataErrorWidget();
        }

        return _buildListViewWidget(snapshot, provider);
      },
    );
  }

  Widget _buildListViewWidget(
      AsyncSnapshot<dynamic> snapshot, RemindersProviderModel provider) {
    return MoviesListViewWidget(
      items: snapshot.data,
      emptyListViewIconData: Icons.notifications,
      emptyListViewText: EMPTY_LIST_VIEW_TEXT,
      onItemTappedFunction: provider.onListViewItemTapped,
    );
  }

  Widget _buildDataErrorWidget() {
    return Text(LIST_VIEW_ERROR_TEXT);
  }
}
