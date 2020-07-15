import 'package:cinema_scheduler/data/models/details/details_data.dart';
import 'package:cinema_scheduler/data/services/details/details_api_service.dart';
import 'package:cinema_scheduler/core/dependences.dart';

class DetailsRepository {
  static DetailsApiService _detailsApiService;

  DetailsRepository() {
    _detailsApiService = DetailsApiService.create(createChopperClient());
  }

  Future<DetailsData> loadOverviewDetails({
    String titleId,
  }) async {
    var validTitleId = _getValidTitleId(titleId);
    final response =
        await _detailsApiService.getOverviewDetails(titleId: validTitleId);

    if (response.isSuccessful) {
      return response.body;
    }

    return null;
  }

  String _getValidTitleId(String titleId) {
    return titleId
        .split("/")
        .firstWhere((element) => element.contains(new RegExp(r'[0-9]')));
  }
}
