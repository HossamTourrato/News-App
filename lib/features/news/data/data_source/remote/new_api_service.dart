import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';
import '../../model/article_model.dart';
part 'new_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseUrl)
abstract class NewApiService{
 factory NewApiService (Dio dio) = _NewApiService;

@GET('/everything')
 Future<HttpResponse <List<ArticleModel>>> getNewsArticle({
   @Query('apiKey') String? apiKey,
   @Query('q') String? q,
});
}