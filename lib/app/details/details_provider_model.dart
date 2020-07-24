import 'package:cinema_scheduler/core/dependences.dart';
import 'package:cinema_scheduler/data/models/app_models/details/details_model.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:flutter/cupertino.dart';

class DetailsProviderModel with ChangeNotifier {
  DetailsModel detailsModel;
  bool isInLoading;

  DetailsProviderModel(TitleModel titleModel) {
    _loadOverviewDetails(titleModel.id);
  }

  Future<void> _loadOverviewDetails(String titleId) async {
    isInLoading = true;
    detailsModel = await detailsRepository.getDetails(titleId: titleId);
    isInLoading = false;

    notifyListeners();
  }
}
