import 'package:chopper/chopper.dart';
import 'package:cinema_scheduler/core/defines/api_endpoints.dart';
import 'package:cinema_scheduler/core/defines/api_headers.dart';
import 'package:cinema_scheduler/data/models/search/search_api_query_parameters.dart';
import 'package:cinema_scheduler/data/models/search/search_data.dart';

part 'search_api_service.chopper.dart';

@ChopperApi(baseUrl: ApiEndpoints.BASE_URL)
abstract class SearchApiService extends ChopperService {
  static SearchApiService create([ChopperClient client]) => _$SearchApiService(client);

  @Get(
    path: ApiEndpoints.SEARCH,
    headers: {
      ApiHeaders.X_RAPID_API_HOST_HEADER_NAME: ApiHeaders.X_RAPID_API_HOST_HEADER_VALUE,
      ApiHeaders.X_RAPID_API_KEY_HEADER_NAME: ApiHeaders.X_RAPID_API_KEY_HEADER_VALUE,
      ApiHeaders.USE_QUERY_STRING_HEADER_NAME: ApiHeaders.USE_QUERY_STRING_HEADER_VALUE,
    },
  )
  Future<Response<SearchData>> search({
    @Query(SearchApiQueryParameters.SEARCH_QUERY) String searchQuery,
  });
}