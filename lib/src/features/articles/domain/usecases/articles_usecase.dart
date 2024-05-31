import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_dio_articles/src/core/network/error/failures.dart';
import 'package:flutter_bloc_dio_articles/src/core/utils/usecases/usecase.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/models/article_model.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/models/article_params.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/repository/abstract_articles_repository.dart';

class ArticlesUseCase extends UseCase<List<ArticleModel>, ArticlesParams> {
  final AbstractArticlesRepository repository;

  ArticlesUseCase(this.repository);
  
  @override
  Future<Either<Failure, List<ArticleModel>>> call(ArticlesParams params) async {
    final result = await repository.getArticles(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}