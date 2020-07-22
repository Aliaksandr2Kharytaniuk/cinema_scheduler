import 'package:cinema_scheduler/core/database_manager.dart';
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
    var result = await _getDetailsDataFromDatabase(titleId);

    if (result == null) {
      result = await _getDetailsDataFromApi(titleId);
      await _saveDetailsDataToDatabase(result);
    }

    return result;
  }

  Future<DetailsData> _getDetailsDataFromDatabase(String titleId) async {
    return await DatabaseManager.instance.query(titleId);
  }

  Future<DetailsData> _getDetailsDataFromApi(String titleId) async {
    final response = await _detailsApiService.getOverviewDetails(
        titleId: _getValidTitleId(titleId));

    if (response.isSuccessful) {
      return response.body;
    }

    return null;
  }

  Future _saveDetailsDataToDatabase(DetailsData data) async {
    await DatabaseManager.instance.insert(data);
  }

  String _getValidTitleId(String titleId) {
    return titleId
        .split("/")
        .firstWhere((element) => element.contains(new RegExp(r'[0-9]')));
  }
}
