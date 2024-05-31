import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_dio_articles/src/core/network/error/failures.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/models/article_model.dart';
import '../models/article_params.dart';

abstract class AbstractArticlesRepository {
  // Get Articles
  Future<Either<Failure, List<ArticleModel>>> getArticles(
      ArticlesParams params);
}
