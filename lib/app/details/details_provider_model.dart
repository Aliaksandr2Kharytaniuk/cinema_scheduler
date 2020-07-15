import 'package:cinema_scheduler/core/dependences.dart';
import 'package:cinema_scheduler/data/models/details/details_data.dart';
import 'package:cinema_scheduler/data/models/title/title_data.dart';
import 'package:flutter/cupertino.dart';

class DetailsProviderModel with ChangeNotifier {
  DetailsData detailsModel;
  bool isInLoading;

  DetailsProviderModel(TitleData titleModel) {
    _loadOverviewDetails(titleModel.id);
  }

  Future<void> _loadOverviewDetails(String titleId) async {
    isInLoading = true;
    detailsModel = await detailsRepository.loadOverviewDetails(titleId: titleId);
    isInLoading = false;

    notifyListeners();
  }
}