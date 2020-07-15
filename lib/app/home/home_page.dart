import 'package:cinema_scheduler/app/common/search/search_text_field_widget.dart';
import 'package:cinema_scheduler/app/decorations/theme_provider.dart';
import 'package:cinema_scheduler/app/home/home_provider_model.dart';
import 'package:cinema_scheduler/data/models/title/title_data.dart';
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
  static const String MINUTES_TEXT = "min";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProviderModel(),
      child: Consumer<HomeProviderModel>(
        builder: (context, HomeProviderModel provider, child) {
          return _buildPage(context, provider);
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, HomeProviderModel provider) {
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
          if (snapshot.hasData) {
            return _buildListViewWidget(context, snapshot, provider);
          } else if (snapshot.hasError) {
            return _buildListViewErrorWidget();
          }

          return _buildEmptyListViewWidget();
        },
      ),
    );
  }

  Widget _buildListViewWidget(BuildContext context,
      AsyncSnapshot<dynamic> snapshot, HomeProviderModel provider) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data.results.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () =>
              provider.onListViewItemTapped(snapshot.data.results[index]),
          child: _buildListViewItemWidget(snapshot, index),
        );
      },
    );
  }

  Widget _buildListViewItemWidget(AsyncSnapshot<dynamic> snapshot, int index) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(color: Colors.white70),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          leading:
              _buildListViewItemLeadingWidget(snapshot.data.results[index]),
          title: _buildListViewItemTitleWidget(snapshot.data.results[index]),
          subtitle:
              _buildListViewItemSubtitleWidget(snapshot.data.results[index]),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30.0,
            color: Colors.black12,
          ),
        ),
      ),
    );
  }

  Widget _buildListViewItemLeadingWidget(TitleData data) {
    return Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 1.0,
            color: Colors.black12,
          ),
        ),
      ),
      child: Container(
        width: 50,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          image: DecorationImage(
            image: NetworkImage(data.image?.url ?? ""),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildListViewItemTitleWidget(TitleData data) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        '${data.title}',
        style: ThemeProvider.getTextTheme(context).subtitle1,
      ),
    );
  }

  Widget _buildListViewItemSubtitleWidget(TitleData data) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.calendar_today,
          size: 10,
          color: Colors.black45,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          '${data.year}',
          style: ThemeProvider.getTextTheme(context)
              .caption
              .copyWith(color: Colors.black45),
        ),
        SizedBox(
          width: 12,
        ),
        Icon(
          Icons.timer,
          size: 12,
          color: Colors.black45,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          '${data.runningTimeInMinutes} ' + MINUTES_TEXT,
          style: ThemeProvider.getTextTheme(context)
              .caption
              .copyWith(color: Colors.black45),
        ),
      ],
    );
  }

  Widget _buildListViewErrorWidget() {
    return Text(LIST_VIEW_ERROR_TEXT);
  }

  Widget _buildEmptyListViewWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.movie,
            size: 80,
            color: Colors.black12,
          ),
          if (true)
            SizedBox(
              height: 12,
            ),
          Text(
            EMPTY_LIST_VIEW_TEXT,
            textAlign: TextAlign.center,
            style: ThemeProvider.getTextTheme(context).subtitle1.copyWith(
                  color: Colors.black26,
                ),
          ),
        ],
      ),
    );
  }
}
