import 'package:flutter_bloc_dio_articles/src/features/articles/domain/models/article_model.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/models/article_params.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/models/article_response_model.dart';

abstract class AbstractArticleApi {
  Future<ApiResponse<List<ArticleModel>>> getArticles(ArticlesParams params);
}
