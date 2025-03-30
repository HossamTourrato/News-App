import 'package:shop_app/core/resources/data_state.dart';
import 'package:shop_app/features/news/domain/entities/article.dart';

abstract class ArticleRepository {

  Future<DataState<List<ArticleEntity>>> getNewsArticle (); 
}