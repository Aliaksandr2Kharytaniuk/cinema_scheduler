import 'package:cinema_scheduler/data/models/search/search_data.dart';
import 'package:cinema_scheduler/data/services/search/search_api_service.dart';
import 'package:cinema_scheduler/core/dependences.dart';

class SearchRepository {
  SearchApiService _searchApiService;

  SearchRepository() {
    _searchApiService = SearchApiService.create(createChopperClient());
  }

  Future<SearchData> loadSearchResults({
    String searchQuery,
  }) async {
    final response = await _searchApiService.search(searchQuery: searchQuery);

    if (response.isSuccessful) {
      return response.body;
    }

    return null;
  }
}
