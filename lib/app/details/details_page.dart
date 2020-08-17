import 'package:cinema_scheduler/app/common/poster/poster_widget.dart';
import 'package:cinema_scheduler/app/decorations/theme_provider.dart';
import 'package:cinema_scheduler/app/details/details_provider_model.dart';
import 'package:cinema_scheduler/app/details/rating_information_widget.dart';
import 'package:cinema_scheduler/app/reminders/reminders_provider_model.dart';
import 'package:cinema_scheduler/app/watch_list/watch_list_provider_model.dart';
import 'package:cinema_scheduler/core/defines/pages_defines.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final TitleModel titleModel;

  const DetailsPage({
    @required this.titleModel,
  });

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<DetailsPage> {
  static const String ADD_TO_WATCHLIST_LABEL = "Add to watchlist";
  static const String REMOVE_FROM_WATCHLIST_LABEL = "Remove from watchlist";
  static const String REMINDERS_HERO_TAG = "rht";

  @override
  Widget build(BuildContext context) {
    final watchlistProvider =
        Provider.of<WatchlistProviderModel>(context, listen: false);
    final remindersProvider =
        Provider.of<RemindersProviderModel>(context, listen: false);

    return ChangeNotifierProvider(
      create: (_) => DetailsProviderModel(widget.titleModel),
      child: Consumer<DetailsProviderModel>(
        builder: (context, DetailsProviderModel provider, child) {
          return _buildPage(
              context, provider, watchlistProvider, remindersProvider);
        },
      ),
    );
  }

  Widget _buildPage(
    BuildContext context,
    DetailsProviderModel provider,
    WatchlistProviderModel watchlistProvider,
    RemindersProviderModel remindersProvider,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PagesDefines.DETAILS_PAGE_TITLE),
        backgroundColor: Colors.black,
      ),
      body: _buildScafoldBodyWidget(context, provider),
      floatingActionButton: _buildScafoldFloatingActionButtonWidget(
        context,
        provider,
        watchlistProvider,
        remindersProvider,
      ),
    );
  }

  Widget _buildScafoldBodyWidget(
      BuildContext context, DetailsProviderModel provider) {
    if (provider.isInLoading == true) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 24.0),
          _buildHeaderWidget(context, provider),
          SizedBox(height: 24.0),
          _buildDescriptionWidget(context, provider),
          SizedBox(height: 24.0),
        ],
      ),
    );
  }

  Widget _buildScafoldFloatingActionButtonWidget(
    BuildContext context,
    DetailsProviderModel provider,
    WatchlistProviderModel watchlistProvider,
    RemindersProviderModel remindersProvider,
  ) {
    if (provider.isInLoading == true) {
      return null;
    }

    return provider.isInWatchlist
        ? _buildRemoveFromWatchlistFloatingActionButtonWidget(
            context,
            provider,
            watchlistProvider,
            remindersProvider,
          )
        : _buildAddToWatchlistFloatingActionButtonWidget(
            context,
            provider,
            watchlistProvider,
          );
  }

  Widget _buildAddToWatchlistFloatingActionButtonWidget(
    BuildContext context,
    DetailsProviderModel provider,
    WatchlistProviderModel watchlistProvider,
  ) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.blue,
      onPressed: () => {
        provider.onAddToWatchlistFloatingActionButtonTapped(
          titleModel: provider.detailsModel.title,
          watchlistProvider: watchlistProvider,
        ),
      },
      icon: Icon(Icons.add),
      label: Text(
        ADD_TO_WATCHLIST_LABEL,
        style: ThemeProvider.getTextTheme(context).caption.copyWith(
              color: Colors.white,
              fontSize: 16.0,
            ),
      ),
    );
  }

  Widget _buildRemoveFromWatchlistFloatingActionButtonWidget(
    BuildContext context,
    DetailsProviderModel provider,
    WatchlistProviderModel watchlistProvider,
    RemindersProviderModel remindersProvider,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildRemindersFloatingActionButtonWidget(
          context,
          provider,
          remindersProvider,
        ),
        SizedBox(
          width: 12,
        ),
        FloatingActionButton.extended(
          backgroundColor: Colors.blue,
          onPressed: () => {
            provider.onRemoveFromWatchlistFloatingActionButtonTapped(
              titleModel: provider.detailsModel.title,
              watchlistProvider: watchlistProvider,
              remindersProvider: remindersProvider,
            ),
          },
          icon: Icon(Icons.remove),
          label: Text(
            REMOVE_FROM_WATCHLIST_LABEL,
            style: ThemeProvider.getTextTheme(context).caption.copyWith(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
          ),
        )
      ],
    );
  }

  Widget _buildRemindersFloatingActionButtonWidget(
    BuildContext context,
    DetailsProviderModel provider,
    RemindersProviderModel remindersProvider,
  ) {
    return provider.isInReminders
        ? _buildRemoveFromRemindersFloatingActionButtonWidget(
            context,
            provider,
            remindersProvider,
          )
        : _buildAddToRemindersFloatingActionButtonWidget(
            context,
            provider,
            remindersProvider,
          );
  }

  Widget _buildAddToRemindersFloatingActionButtonWidget(
    BuildContext context,
    DetailsProviderModel provider,
    RemindersProviderModel remindersProvider,
  ) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () => {
        provider.onAddToRemindersFloatingActionButtonTapped(
          titleModel: provider.detailsModel.title,
          remindersProvider: remindersProvider,
        ),
      },
      child: Icon(Icons.notifications_active),
      heroTag: REMINDERS_HERO_TAG,
    );
  }

  Widget _buildRemoveFromRemindersFloatingActionButtonWidget(
    BuildContext context,
    DetailsProviderModel provider,
    RemindersProviderModel remindersProvider,
  ) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () => {
        provider.onRemoveFromRemindersFloatingActionButtonTapped(
          titleModel: provider.detailsModel.title,
          remindersProvider: remindersProvider,
        ),
      },
      child: Icon(Icons.notifications_off),
      heroTag: REMINDERS_HERO_TAG,
    );
  }

  Widget _buildHeaderWidget(
      BuildContext context, DetailsProviderModel provider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PosterWidget(
            provider.detailsModel?.title?.image?.url,
            height: 180.0,
            shouldUseLoader: true,
          ),
          SizedBox(width: 24.0),
          Expanded(
            child: _buildHeaderMetadataWidget(context, provider),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderMetadataWidget(
      BuildContext context, DetailsProviderModel provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '${provider.detailsModel?.title?.title}',
          style: ThemeProvider.getTextTheme(context).headline6,
        ),
        SizedBox(height: 12.0),
        RatingInformationWidget(
          ratingsModel: provider.detailsModel?.ratings,
        ),
        SizedBox(height: 8.0),
        Row(
          children: _buildHeaderGenresWidget(context, provider),
        ),
      ],
    );
  }

  List<Widget> _buildHeaderGenresWidget(
      BuildContext context, DetailsProviderModel provider) {
    return provider.detailsModel?.genres
        ?.map((genre) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Chip(
              label: Text(genre),
              labelStyle: ThemeProvider.getTextTheme(context).caption,
              backgroundColor: Colors.black12,
            ),
          );
        })
        ?.take(2)
        ?.toList();
  }

  Widget _buildDescriptionWidget(
      BuildContext context, DetailsProviderModel provider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: ExpandText(
        '${provider.detailsModel.plotSummary?.text}',
        maxLines: 6,
        arrowColor: Colors.black45,
        style: ThemeProvider.getTextTheme(context).bodyText2.copyWith(
              color: Colors.black45,
              fontSize: 16.0,
            ),
      ),
    );
  }
}
