import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable{

  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticleState({this.articles, this.error});
  @override
  List<Object> get props => [articles!, error!];

}

class RemoteArticleLoading extends RemoteArticleState {}

class RemoteArticleFetched extends RemoteArticleState {
  const RemoteArticleFetched (List<ArticleEntity> articles) : super(articles: articles);
}

class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError (DioException error) : super(error: error);
}

