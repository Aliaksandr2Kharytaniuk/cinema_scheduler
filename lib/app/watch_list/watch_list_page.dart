import 'package:cinema_scheduler/app/common/general_page_error_widget.dart';
import 'package:cinema_scheduler/app/common/movies_listview/movies_listview_widget.dart';
import 'package:cinema_scheduler/app/watch_list/watch_list_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchListPage extends StatefulWidget {
  @override
  _WatchListState createState() => _WatchListState();
}

class _WatchListState extends State<WatchListPage> {
  static const String EMPTY_LIST_VIEW_TEXT =
      "You have no items in watchlist\nOpen any movie to add them!";
  static const String LIST_VIEW_ERROR_TEXT = "Ooops! Some error has occurred";

  @override
  Widget build(BuildContext context) {
    return Consumer<WatchlistProviderModel>(
      builder: (context, WatchlistProviderModel provider, child) {
        return _buildPage(provider);
      },
    );
  }

  Widget _buildPage(WatchlistProviderModel provider) {
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

  Widget _buildListViewWidget(WatchlistProviderModel provider) {
    return MoviesListViewWidget(
      items: provider.watchlistCollection,
      emptyListViewIconData: Icons.list,
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
