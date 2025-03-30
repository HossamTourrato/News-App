import 'package:shop_app/core/resources/data_state.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/news/domain/entities/article.dart';

import '../repository/article_repository.dart';

class GetArticleUseCase implements UseCase <DataState<List<ArticleEntity>>,void>{

  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }
  
}