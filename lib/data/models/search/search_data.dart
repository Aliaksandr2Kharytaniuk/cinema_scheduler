import 'package:cinema_scheduler/data/models/title/title_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_data.g.dart';

@JsonSerializable()
class SearchData {
  final List<TitleData> results;

  SearchData(
    this.results,
  );

  static const fromJsonFactory = _$SearchDataFromJson;

  factory SearchData.fromJson(Map<String, dynamic> json) =>
      _$SearchDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDataToJson(this);
}
