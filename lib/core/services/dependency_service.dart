import 'package:cinema_scheduler/core/json_serializable_converter.dart';
import 'package:cinema_scheduler/core/services/navigation_service.dart';
import 'package:cinema_scheduler/core/get_it_extension.dart';
import 'package:cinema_scheduler/data/cache/app_database.dart';
import 'package:cinema_scheduler/data/repositories/details/details_repository.dart';
import 'package:cinema_scheduler/data/repositories/search/search_repository.dart';
import 'package:cinema_scheduler/data/repositories/watch_list_repository/watch_list_repository.dart';
import 'package:cinema_scheduler/data/services/details/details_api_service.dart';
import 'package:cinema_scheduler/data/services/search/search_api_service.dart';
import 'package:get_it/get_it.dart';

final _ioc = GetIt.I;

JsonSerializableConverter get jsonSerializableConverter =>
    JsonSerializableConverter();

NavigationService get navigationService => _ioc.get<NavigationService>();

SearchRepository get searchRepository => _ioc.get<SearchRepository>();
DetailsRepository get detailsRepository => _ioc.get<DetailsRepository>();
WatchlistRepository get watchlistRepository => _ioc.get<WatchlistRepository>();

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
      ..registerLazySingleton(() => WatchlistRepository())
      ..registerApiServices()
      ..registerSingletonAsync(() async {
        final appDatabase = AppDatabase();
        await appDatabase.initializeDatabase();
        return appDatabase;
      });
  }
}
