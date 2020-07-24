import 'package:cinema_scheduler/data/models/app_models/title/title_model.dart';
import 'package:cinema_scheduler/data/models/data_models/search/search_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  final List<TitleModel> results;

  SearchModel({
    this.results,
  });

  static const fromJsonFactory = _$SearchModelFromJson;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  factory SearchModel.fromSearchData(SearchData data) => SearchModel(
        results: data.results.map((e) => TitleModel.fromTitleData(e)).toList(),
      );

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}
