import 'package:chopper/chopper.dart';
import 'package:cinema_scheduler/core/json_serializable_converter.dart';
import 'package:cinema_scheduler/data/services/details/details_api_service.dart';
import 'package:cinema_scheduler/data/services/search/search_api_service.dart';
import 'package:get_it/get_it.dart';

extension GetItExtension on GetIt {
  static final _jsonSerializableConverter = JsonSerializableConverter();

  static final _chopper = ChopperClient(
    services: [
      SearchApiService.create(),
      DetailsApiService.create(),
    ],
    converter: _jsonSerializableConverter,
  );

  void registerApiServices() {
    registerLazySingleton<SearchApiService>(
        () => SearchApiService.create(_chopper));
    registerLazySingleton<DetailsApiService>(
        () => DetailsApiService.create(_chopper));
  }
}
