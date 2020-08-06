import 'package:cinema_scheduler/core/defines/cache_defines.dart';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:cinema_scheduler/data/repositories/repository_base.dart';

class RemindersRepository extends RepositoryBase<TitleModel> {
  static const FILTER_FIELD = "id";

  RemindersRepository()
      : super(
          filterFieldForItem: FILTER_FIELD,
          repositoryKey: CacheDefines.reminders,
        );

  Future<List<TitleModel>> getReminders() async {
    var result = await appDatabase.getAll(
      CacheDefines.reminders,
      TitleModel.fromJsonFactory,
    );

    return result;
  }

  Future<bool> isItemInReminders({
    String titleId,
  }) async {
    var cacheResult = await appDatabase.getByEqualsFilter(
      CacheDefines.reminders,
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
