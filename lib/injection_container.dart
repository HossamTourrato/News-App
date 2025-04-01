import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/features/news/domain/repository/article_repository.dart';
import 'features/auth/data/data_source/firebase_auth.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecase/auth_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
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
  serviceLocator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  serviceLocator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl( serviceLocator(), firebaseAuth: serviceLocator(), googleSignIn: serviceLocator()),);
  serviceLocator.registerLazySingleton(() => SignInWithGoogle(serviceLocator()));
  serviceLocator.registerLazySingleton(() => SignInWithEmail(serviceLocator()));
  serviceLocator.registerLazySingleton(() => SignOut(serviceLocator()));
  serviceLocator.registerFactory(() => AuthBloc(signInWithEmail: serviceLocator(), signOut: serviceLocator(), signInWithGoogle: serviceLocator()));

}