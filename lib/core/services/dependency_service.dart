import 'package:cinema_scheduler/core/json_serializable_converter.dart';
import 'package:cinema_scheduler/core/services/navigation_service.dart';
import 'package:cinema_scheduler/core/get_it_extension.dart';
import 'package:cinema_scheduler/data/cache/app_database.dart';
import 'package:cinema_scheduler/data/models/data_models/details/details_data.dart';
import 'package:cinema_scheduler/data/models/data_models/details/details_plot_summary_data.dart';
import 'package:cinema_scheduler/data/models/data_models/details/details_ratings_data.dart';
import 'package:cinema_scheduler/data/models/data_models/search/search_data.dart';
import 'package:cinema_scheduler/data/models/data_models/title/title_data.dart';
import 'package:cinema_scheduler/data/models/data_models/title/title_image_data.dart';
import 'package:cinema_scheduler/data/repositories/details/details_repository.dart';
import 'package:cinema_scheduler/data/repositories/search/search_repository.dart';
import 'package:cinema_scheduler/data/services/details/details_api_service.dart';
import 'package:cinema_scheduler/data/services/search/search_api_service.dart';
import 'package:get_it/get_it.dart';

final _ioc = GetIt.I;

CustomJsonDecoder get jsonDecoder => _ioc.get<CustomJsonDecoder>();
JsonSerializableConverter get jsonSerializableConverter =>
    _ioc.get<JsonSerializableConverter>();

NavigationService get navigationService => _ioc.get<NavigationService>();

SearchRepository get searchRepository => _ioc.get<SearchRepository>();
DetailsRepository get detailsRepository => _ioc.get<DetailsRepository>();

SearchApiService get searchApiService => _ioc.get<SearchApiService>();
DetailsApiService get detailsApiService => _ioc.get<DetailsApiService>();

AppDatabase get appDatabase => _ioc.get<AppDatabase>();

class DependencyService {
  static void registerDependencies() {
    _ioc.reset();

    _ioc
      ..registerLazySingleton(() => NavigationService())
      ..registerLazySingleton(() => SearchRepository())
      ..registerLazySingleton(() => DetailsRepository())
      ..registerHttpClient()
      ..registerLazySingleton(() => JsonSerializableConverter())
      ..registerLazySingleton(() => CustomJsonDecoder({
            SearchData: SearchData.fromJsonFactory,
            TitleData: TitleData.fromJsonFactory,
            TitleImageData: TitleImageData.fromJsonFactory,
            DetailsData: DetailsData.fromJsonFactory,
            DetailsRatingsData: DetailsRatingsData.fromJsonFactory,
            DetailsPlotSummaryData: DetailsPlotSummaryData.fromJsonFactory,
          }))
      ..registerSingletonAsync(() async {
        final appDatabase = AppDatabase();
        await appDatabase.initializeDatabase();
        return appDatabase;
      });
  }
}
