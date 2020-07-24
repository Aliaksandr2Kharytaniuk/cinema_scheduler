import 'package:cinema_scheduler/data/models/app_models/details/details_model.dart';
import 'package:cinema_scheduler/data/services/details/details_api_service.dart';
import 'package:cinema_scheduler/core/dependences.dart';

class DetailsRepository {
  static DetailsApiService _detailsApiService;

  DetailsRepository() {
    _detailsApiService = DetailsApiService.create(createChopperClient());
  }

  Future<DetailsModel> getDetails({
    String titleId,
  }) async {
    var result = await _getDetailsDataFromCache(titleId);

    if (result == null) {
      result = await _getDetailsDataFromApi(titleId);
      await _setDetailsDataToCache(result);
    }

    return result;
  }

  Future<DetailsModel> _getDetailsDataFromApi(String titleId) async {
    final response = await _detailsApiService.getOverviewDetails(
        titleId: _getValidTitleId(titleId));

    if (response.isSuccessful) {
      return DetailsModel.fromDetailsData(response.body);
    }

    return null;
  }

  Future<DetailsModel> _getDetailsDataFromCache(String titleId) async {}

  Future _setDetailsDataToCache(DetailsModel data) async {}

  String _getValidTitleId(String titleId) {
    return titleId
        .split("/")
        .firstWhere((element) => element.contains(new RegExp(r'[0-9]')));
  }
}
