import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shop_app/core/resources/data_state.dart';
import 'package:shop_app/features/news/data/data_source/remote/new_api_service.dart';
import 'package:shop_app/features/news/data/model/article_model.dart';
import 'package:shop_app/features/news/domain/repository/article_repository.dart';
import '../../../../core/constants/constants.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewApiService _newApiService;
  ArticleRepositoryImpl(this._newApiService);
  @override

  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try{
    final httpResponse = await _newApiService.getNewsArticle(
        apiKey: newsAPIKey,
        q: query
    );

    if (httpResponse.response.statusCode == HttpStatus.ok) {
      print("hello hossam this is my data${httpResponse.data}");
      return DataSuccess(httpResponse.data);
    } else {
      return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions

      ));
    }
  } on DioException catch (e) {
      return DataFailed(e);
    }
  }

}