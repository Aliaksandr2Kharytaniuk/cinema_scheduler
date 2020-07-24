import 'package:chopper/chopper.dart';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/services/details/details_api_service.dart';
import 'package:cinema_scheduler/data/services/search/search_api_service.dart';
import 'package:get_it/get_it.dart';

extension GetItExtension on GetIt {
  void registerHttpClient() {
    final chopper = ChopperClient(
      services: [
        SearchApiService.create(),
        DetailsApiService.create(),
      ],
      converter: jsonSerializableConverter,
    );

    registerLazySingleton<SearchApiService>(
        () => SearchApiService.create(chopper));
    registerLazySingleton<DetailsApiService>(
        () => DetailsApiService.create(chopper));
  }
}
