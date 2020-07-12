import 'package:json_annotation/json_annotation.dart';

part 'details_plot_summary_data.g.dart';

@JsonSerializable()
class DetailsPlotSummaryData {
  final String author;
  final String text;

  DetailsPlotSummaryData(
    this.author,
    this.text,
  );

  static const fromJsonFactory = _$DetailsPlotSummaryDataFromJson;

  factory DetailsPlotSummaryData.fromJson(Map<String, dynamic> json) =>
      _$DetailsPlotSummaryDataFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsPlotSummaryDataToJson(this);
}
