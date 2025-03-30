import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/resources/data_state.dart';
import 'package:shop_app/features/news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:shop_app/features/news/presentation/bloc/article/remote/remote_article_state.dart';
import '../../../../domain/usecase/get_article.dart';


class RemoteArticleBloc extends Bloc <RemoteArticleEvent, RemoteArticleState> {

  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase) : super(RemoteArticleLoading()){
    on<GetArticle> (onGetArticle);
  }

  void onGetArticle(GetArticle event, Emitter<RemoteArticleState> emit)  async{

    final dataSate = await _getArticleUseCase();

    if (dataSate is DataSuccess && dataSate.data!.isNotEmpty) {
      emit(RemoteArticleFetched(dataSate.data!));
    }
    if (dataSate is DataFailed) {
      emit(RemoteArticleError(dataSate.error!));
    }

  }

}