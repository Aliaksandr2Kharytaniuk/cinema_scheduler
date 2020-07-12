import 'package:cinema_scheduler/app/details/details_provider_model.dart';
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
    return Consumer<DetailsProviderModel>(
      builder: (context, DetailsProviderModel provider, child) {
        return _buildPage(context, provider);
      },
    );
  }

  Widget _buildPage(BuildContext context, DetailsProviderModel provider) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SCAFOLD_TITLE),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderWidget(context, provider),
            _buildDescriptionWidget(context, provider),
            SizedBox(height: 24.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildHeaderWidget(BuildContext context, DetailsProviderModel provider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Text("ololo"),
    );
  }

  Widget _buildDescriptionWidget(BuildContext context, DetailsProviderModel provider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Text("ololo"),
    );
  }
}