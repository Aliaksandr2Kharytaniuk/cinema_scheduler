import 'dart:convert';
import 'package:cinema_scheduler/core/services/dependency_service.dart';
import 'package:cinema_scheduler/data/models/app_models/model_base.dart';

class RepositoryBase<T extends ModelBase> {
  final String filterFieldForItem;
  final String repositoryKey;

  RepositoryBase({
    this.filterFieldForItem,
    this.repositoryKey,
  });

  Future edit(T item) async {
    return appDatabase.updateByEqualsFilter(
        repositoryKey, json.decode(json.encode(item)) as Map<String, dynamic>, {
      filterFieldForItem: item.id,
    });
  }

  Future add(T item) async {
    return appDatabase.saveMap(
        repositoryKey, json.decode(json.encode(item)) as Map<String, dynamic>);
  }

  Future remove(T item) async {
    return appDatabase.deleteDataByFilter(repositoryKey, {
      filterFieldForItem: item.id,
    });
  }
}
