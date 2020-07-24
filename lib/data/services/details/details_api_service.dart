import 'package:chopper/chopper.dart';
import 'package:cinema_scheduler/core/defines/api_endpoints.dart';
import 'package:cinema_scheduler/core/defines/api_headers.dart';
import 'package:cinema_scheduler/data/models/data_models/details/details_api_query_parameters.dart';
import 'package:cinema_scheduler/data/models/data_models/details/details_data.dart';

part 'details_api_service.chopper.dart';

@ChopperApi(baseUrl: ApiEndpoints.BASE_URL)
abstract class DetailsApiService extends ChopperService {
  static DetailsApiService create([ChopperClient client]) =>
      _$DetailsApiService(client);

  @Get(
    path: ApiEndpoints.OVERVIEW_DETAILS,
    headers: {
      ApiHeaders.X_RAPID_API_HOST_HEADER_NAME:
          ApiHeaders.X_RAPID_API_HOST_HEADER_VALUE,
      ApiHeaders.X_RAPID_API_KEY_HEADER_NAME:
          ApiHeaders.X_RAPID_API_KEY_HEADER_VALUE,
      ApiHeaders.USE_QUERY_STRING_HEADER_NAME:
          ApiHeaders.USE_QUERY_STRING_HEADER_VALUE,
    },
  )
  Future<Response<DetailsData>> getOverviewDetails({
    @Query(DetailsApiQueryParameters.TITLE_ID) String titleId,
  });
}
