import 'package:cinema_scheduler/app/common/movies_listview/movies_listview_widget.dart';
import 'package:cinema_scheduler/app/common/search/search_text_field_widget.dart';
import 'package:cinema_scheduler/app/home/home_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String EMPTY_LIST_VIEW_TEXT =
      "Enter any search query to start\nbrowse movies";
  static const String LIST_VIEW_ERROR_TEXT = "Ooops! Some error has occurred";

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProviderModel>(
      builder: (context, HomeProviderModel provider, child) {
        return _buildPage(provider);
      },
    );
  }

  Widget _buildPage(HomeProviderModel provider) {
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Column(
        children: <Widget>[
          _buildSearchWidget(provider),
          SizedBox(
            height: 24,
          ),
          _buildContentWidget(context, provider),
        ],
      ),
    );
  }

  Widget _buildSearchWidget(HomeProviderModel provider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SearchTextFieldWidget(
        onSubmittedFunction: provider.onSearchSubmitted,
      ),
    );
  }

  Widget _buildContentWidget(BuildContext context, HomeProviderModel provider) {
    return Flexible(
      child: FutureBuilder(
        future: provider.searchDataFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return _buildDataErrorWidget();
          }

          return _buildListViewWidget(snapshot, provider);
        },
      ),
    );
  }

  Widget _buildListViewWidget(
      AsyncSnapshot<dynamic> snapshot, HomeProviderModel provider) {
    return MoviesListViewWidget(
      items: snapshot.data?.results,
      emptyListViewIconData: Icons.search,
      emptyListViewText: EMPTY_LIST_VIEW_TEXT,
      onItemTappedFunction: provider.onListViewItemTapped,
    );
  }

  Widget _buildDataErrorWidget() {
    return Text(LIST_VIEW_ERROR_TEXT);
  }
}
