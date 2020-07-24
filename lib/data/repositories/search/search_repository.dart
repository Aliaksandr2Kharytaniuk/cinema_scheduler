import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/models/app_models/search/search_model.dart';

class SearchRepository {
  Future<SearchModel> loadSearchResults({
    String searchQuery,
  }) async {
    final response = await searchApiService.search(searchQuery: searchQuery);

    if (response.isSuccessful) {
      return SearchModel.fromSearchData(response.body);
    }

    return null;
  }
}
