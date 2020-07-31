import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/models/app_models/details/details_model.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:flutter/cupertino.dart';

class DetailsProviderModel with ChangeNotifier {
  DetailsModel detailsModel;
  bool isInWatchlist;
  bool isInLoading;

  DetailsProviderModel(TitleModel titleModel) {
    _loadOverviewDetails(titleModel.id);
  }

  Future onFloatingActionButtonTapped() async {
    isInWatchlist = !isInWatchlist;
    notifyListeners();
  }

  Future _loadOverviewDetails(String titleId) async {
    isInLoading = true;
    notifyListeners();

    detailsModel = await detailsRepository.getDetails(titleId: titleId);
    isInWatchlist =
        await watchlistRepository.isItemWatchlisted(titleId: titleId);

    isInLoading = false;
    notifyListeners();
  }
}
