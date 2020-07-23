import 'package:cinema_scheduler/data/models/details/details_data.dart';
import 'package:cinema_scheduler/data/services/details/details_api_service.dart';
import 'package:cinema_scheduler/core/dependences.dart';

class DetailsRepository {
  static DetailsApiService _detailsApiService;

  DetailsRepository() {
    _detailsApiService = DetailsApiService.create(createChopperClient());
  }

  Future<DetailsData> getDetails({
    String titleId,
  }) async {
    var result = await _getDetailsDataFromCache(titleId);

    if (result == null) {
      result = await _getDetailsDataFromApi(titleId);
      await _setDetailsDataToCache(result);
    }

    return result;
  }

  Future<DetailsData> _getDetailsDataFromApi(String titleId) async {
    final response = await _detailsApiService.getOverviewDetails(
        titleId: _getValidTitleId(titleId));

    if (response.isSuccessful) {
      return response.body;
    }

    return null;
  }

  Future<DetailsData> _getDetailsDataFromCache(String titleId) async {}

  Future _setDetailsDataToCache(DetailsData data) async {}

  String _getValidTitleId(String titleId) {
    return titleId
        .split("/")
        .firstWhere((element) => element.contains(new RegExp(r'[0-9]')));
  }
}
