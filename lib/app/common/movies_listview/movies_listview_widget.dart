import 'package:cinema_scheduler/app/common/poster/poster_widget.dart';
import 'package:cinema_scheduler/app/decorations/theme_provider.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:flutter/material.dart';

class MoviesListViewWidget extends StatefulWidget {
  final List<TitleModel> items;
  final String emptyListViewText;

  const MoviesListViewWidget({
    @required this.items,
    @required this.emptyListViewText,
  });

  @override
  _MoviesListViewWidgetState createState() => _MoviesListViewWidgetState();
}

class _MoviesListViewWidgetState extends State<MoviesListViewWidget> {
  static const String MINUTES_TEXT = "min";

  @override
  Widget build(BuildContext context) {
    if (widget.items != null && widget.items.length > 0) {
      return _buildListViewWidget(context);
    }

    return _buildEmptyListViewWidget();
  }

  Widget _buildListViewWidget(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => {},
          child: _buildListViewItemWidget(index),
        );
      },
    );
  }

  Widget _buildListViewItemWidget(int index) {
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
          leading: _buildListViewItemLeadingWidget(widget.items[index]),
          title: _buildListViewItemTitleWidget(widget.items[index]),
          subtitle: _buildListViewItemSubtitleWidget(widget.items[index]),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30.0,
            color: Colors.black12,
          ),
        ),
      ),
    );
  }

  Widget _buildListViewItemLeadingWidget(TitleModel model) {
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
      child: PosterWidget(
        model.image?.url,
        height: 50,
      ),
    );
  }

  Widget _buildListViewItemTitleWidget(TitleModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        '${model.title}',
        style: ThemeProvider.getTextTheme(context).subtitle1,
      ),
    );
  }

  Widget _buildListViewItemSubtitleWidget(TitleModel model) {
    return Row(
      children: <Widget>[
        Visibility(
          visible: model.year != null,
          child: Row(
            children: _buildListViewItemSubtitleYearWidget(model),
          ),
        ),
        Visibility(
          visible: model.runningTimeInMinutes != null,
          child: Row(
            children: _buildListViewItemSubtitleDurationWidget(model),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildListViewItemSubtitleYearWidget(TitleModel model) {
    return <Widget>[
      Icon(
        Icons.calendar_today,
        size: 10,
        color: Colors.black45,
      ),
      SizedBox(
        width: 4,
      ),
      Text(
        '${model.year}',
        style: ThemeProvider.getTextTheme(context)
            .caption
            .copyWith(color: Colors.black45),
      ),
      SizedBox(
        width: 12,
      ),
    ];
  }

  List<Widget> _buildListViewItemSubtitleDurationWidget(TitleModel model) {
    return <Widget>[
      Icon(
        Icons.timer,
        size: 12,
        color: Colors.black45,
      ),
      SizedBox(
        width: 2,
      ),
      Text(
        '${model.runningTimeInMinutes} ' + MINUTES_TEXT,
        style: ThemeProvider.getTextTheme(context)
            .caption
            .copyWith(color: Colors.black45),
      ),
    ];
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
          SizedBox(
            height: 12,
          ),
          Text(
            widget.emptyListViewText,
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
