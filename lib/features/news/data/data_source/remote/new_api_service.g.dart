// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _NewApiService implements NewApiService {
  _NewApiService(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://newsapi.org/v2';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }

  @override
  Future<HttpResponse<List<ArticleModel>>> getNewsArticle({String? apiKey, String? q}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'apiKey': apiKey,
      'q': q,
    };
    // headers: _headers, extra: _extra    data: _data
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String,dynamic>>(
        _setStreamType<HttpResponse<List<ArticleModel>>>(
            Options(method: 'GET',    )
                .compose(_dio.options, '/everything',
                queryParameters: queryParameters,      )
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    List<ArticleModel> value = _result.data!['articles']
        .map<ArticleModel>((dynamic i) => ArticleModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }
}
