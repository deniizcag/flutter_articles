import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_dio_articles/src/core/network/error/exceptions.dart';
import 'package:flutter_bloc_dio_articles/src/core/network/error/failures.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/data/data_sources/remote/article_api_imp.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/models/article_model.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/models/article_params.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/repository/abstract_articles_repository.dart';

class ArticlesRepositoryImp extends AbstractArticlesRepository {
  final ArticleApiImp articlesApi;

  ArticlesRepositoryImp(this.articlesApi);

  @override
  Future<Either<Failure, List<ArticleModel>>> getArticles(
      ArticlesParams params) async {
    try {
      final result = await articlesApi.getArticles(params);
      return Right(result.results ?? []);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
