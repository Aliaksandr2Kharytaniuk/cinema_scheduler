import 'package:cinema_scheduler/core/defines/cache_defines.dart';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:cinema_scheduler/data/repositories/repository_base.dart';

class WatchlistRepository extends RepositoryBase<TitleModel> {
  static const FILTER_FIELD = "id";

  WatchlistRepository()
      : super(
          filterFieldForItem: FILTER_FIELD,
          repositoryKey: CacheDefines.watchlist,
        );

  Future<List<TitleModel>> getWatchlist() async {
    var result = await appDatabase.getAll(
      CacheDefines.watchlist,
      TitleModel.fromJsonFactory,
    );

    return result;
  }

  Future<bool> isItemWatchlisted({
    String titleId,
  }) async {
    var cacheResult = await appDatabase.getByEqualsFilter(
      CacheDefines.watchlist,
      TitleModel.fromJsonFactory,
      {
        filterFieldForItem: titleId,
      },
    );

    if (cacheResult != null && cacheResult.isNotEmpty) {
      return true;
    }

    return false;
  }
}
