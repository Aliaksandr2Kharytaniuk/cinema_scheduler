import 'package:chopper/chopper.dart';
import 'package:cinema_scheduler/core/custom_json_decoder.dart';
import 'package:cinema_scheduler/data/models/data_models/details/details_data.dart';
import 'package:cinema_scheduler/data/models/data_models/details/details_plot_summary_data.dart';
import 'package:cinema_scheduler/data/models/data_models/details/details_ratings_data.dart';
import 'package:cinema_scheduler/data/models/data_models/search/search_data.dart';
import 'package:cinema_scheduler/data/models/data_models/title/title_data.dart';
import 'package:cinema_scheduler/data/models/data_models/title/title_image_data.dart';

class JsonSerializableConverter extends JsonConverter {
  final _jsonDecoder = CustomJsonDecoder({
    SearchData: SearchData.fromJsonFactory,
    TitleData: TitleData.fromJsonFactory,
    TitleImageData: TitleImageData.fromJsonFactory,
    DetailsData: DetailsData.fromJsonFactory,
    DetailsRatingsData: DetailsRatingsData.fromJsonFactory,
    DetailsPlotSummaryData: DetailsPlotSummaryData.fromJsonFactory,
  });

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: _jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}
