import 'dart:ui';

import 'package:cinema_scheduler/app/common/poster/poster_widget.dart';
import 'package:cinema_scheduler/app/decorations/theme_provider.dart';
import 'package:cinema_scheduler/app/details/details_provider_model.dart';
import 'package:cinema_scheduler/app/details/rating_information_widget.dart';
import 'package:cinema_scheduler/data/models/title/title_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final TitleData titleModel;

  const DetailsPage({
    this.titleModel,
  });

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<DetailsPage> {
  static const String SCAFOLD_TITLE = "Details page";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailsProviderModel(widget.titleModel),
      child: Consumer<DetailsProviderModel>(
        builder: (context, DetailsProviderModel provider, child) {
          return _buildPage(context, provider);
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, DetailsProviderModel provider) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SCAFOLD_TITLE),
      ),
      body: _buildScafoldBodyWidget(context, provider),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: Icon(Icons.add),
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

  Widget _buildHeaderWidget(
      BuildContext context, DetailsProviderModel provider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PosterWidget(
            provider.detailsModel.title.image.url,
            height: 180.0,
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
          provider.detailsModel.title.title,
          style: ThemeProvider.getTextTheme(context).headline6,
        ),
        SizedBox(height: 12.0),
        RatingInformationWidget(provider.detailsModel.ratings),
        SizedBox(height: 8.0),
        Row(
          children: _buildHeaderGenresWidget(context, provider),
        ),
      ],
    );
  }

  List<Widget> _buildHeaderGenresWidget(
      BuildContext context, DetailsProviderModel provider) {
    return provider.detailsModel.genres
        .map((genre) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Chip(
              label: Text(genre),
              labelStyle: ThemeProvider.getTextTheme(context).caption,
              backgroundColor: Colors.black12,
            ),
          );
        })
        .take(2)
        .toList();
  }

  Widget _buildDescriptionWidget(
      BuildContext context, DetailsProviderModel provider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        provider.detailsModel.plotSummary.text,
        style: ThemeProvider.getTextTheme(context).bodyText2.copyWith(
              color: Colors.black45,
              fontSize: 16.0,
            ),
      ),
    );
  }
}
