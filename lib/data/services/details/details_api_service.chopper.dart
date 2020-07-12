// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$DetailsApiService extends DetailsApiService {
  _$DetailsApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DetailsApiService;

  @override
  Future<Response<DetailsData>> getOverviewDetails({String titleId}) {
    final $url = 'https://imdb8.p.rapidapi.com/title/get-overview-details';
    final $params = <String, dynamic>{'tconst': titleId};
    final $headers = {
      'x-rapidapi-host': 'imdb8.p.rapidapi.com',
      'x-rapidapi-key': '57f73aee5emshc7e8d4d22956442p1e526ejsna0cb3866904a',
      'useQueryString': 'true'
    };
    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<DetailsData, DetailsData>($request);
  }
}
