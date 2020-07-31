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
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: _buildContentWidget(provider),
    );
  }

  Widget _buildContentWidget(WatchlistProviderModel provider) {
    return FutureBuilder(
      future: provider.watchlistDataFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _buildDataErrorWidget();
        }

        return _buildListViewWidget(snapshot, provider);
      },
    );
  }

  Widget _buildListViewWidget(
      AsyncSnapshot<dynamic> snapshot, WatchlistProviderModel provider) {
    return MoviesListViewWidget(
      items: snapshot.data,
      emptyListViewText: EMPTY_LIST_VIEW_TEXT,
      onItemTappedFunction: provider.onListViewItemTapped,
    );
  }

  Widget _buildDataErrorWidget() {
    return Text(LIST_VIEW_ERROR_TEXT);
  }
}
