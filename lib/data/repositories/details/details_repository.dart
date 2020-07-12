import 'package:cinema_scheduler/data/models/details/details_data.dart';
import 'package:cinema_scheduler/data/services/details/details_api_service.dart';
import 'package:cinema_scheduler/core/dependences.dart';

class DetailsRepository {
  DetailsApiService _detailsApiService;

  DetailsRepository() {
    _detailsApiService = DetailsApiService.create(createChopperClient());
  }

  Future<DetailsData> loadSearchResults({
    String titleId,
  }) async {
    final response = await _detailsApiService.getOverviewDetails(titleId: titleId);

    if (response.isSuccessful) {
      return response.body;
    }
    
    return null;
  }
}