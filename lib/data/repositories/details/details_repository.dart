import 'dart:convert';
import 'package:cinema_scheduler/core/defines/cache_defines.dart';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/models/app_models/details/details_model.dart';
import 'package:cinema_scheduler/data/repositories/repository_base.dart';

class DetailsRepository extends RepositoryBase<DetailsModel> {
  static const FILTER_FIELD = "id";

  DetailsRepository()
      : super(
          filterFieldForItem: FILTER_FIELD,
          repositoryKey: CacheDefines.detailsOverview,
        );

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
    final response = await detailsApiService.getOverviewDetails(
        titleId: _getValidTitleId(titleId));

    if (response.isSuccessful) {
      return DetailsModel.fromDetailsData(response.body);
    }

    return null;
  }

  Future<DetailsModel> _getDetailsDataFromCache(String titleId) async {
    var cacheResult = await appDatabase.getByEqualsFilter(
      CacheDefines.detailsOverview,
      DetailsModel.fromJsonFactory,
      {
        filterFieldForItem: titleId,
      },
    );

    if (cacheResult != null && cacheResult.isNotEmpty) {
      return cacheResult.first;
    }

    return null;
  }

  Future _setDetailsDataToCache(DetailsModel data) async {
    await appDatabase.saveMap(CacheDefines.detailsOverview,
        json.decode(json.encode(data)) as Map<String, dynamic>);
  }

  String _getValidTitleId(String titleId) {
    return titleId
        .split("/")
        .firstWhere((element) => element.contains(new RegExp(r'[0-9]')));
  }
}
