import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_app/features/news/domain/repository/article_repository.dart';
import 'features/news/data/data_source/remote/new_api_service.dart';
import 'features/news/data/repository/repository_impl.dart';
import 'features/news/domain/usecase/get_article.dart';
import 'features/news/presentation/bloc/article/remote/remote_article_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies () async {


  serviceLocator.registerSingleton<Dio>(Dio());

  serviceLocator.registerSingleton<NewApiService>(NewApiService(serviceLocator()));

  serviceLocator.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(serviceLocator()));

  serviceLocator.registerSingleton<GetArticleUseCase>(GetArticleUseCase(serviceLocator()));

  serviceLocator.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(serviceLocator()));

}