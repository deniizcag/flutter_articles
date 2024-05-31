import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_dio_articles/src/features/articles/domain/models/article_params.dart';

import '../../../../../core/network/error/failures.dart';
import '../../../domain/models/article_model.dart';
import '../../../domain/usecases/articles_usecase.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final ArticlesUseCase articlesUseCase;

  List<ArticleModel> allArticles = [];

  ArticlesBloc(this.articlesUseCase) : super(ArticlesInitialState()) {
    on<OnGettingArticlesEvent>(_onGettingArticlesEvent);
  }

  _onGettingArticlesEvent(
      OnGettingArticlesEvent event, Emitter<ArticlesState> emitter) async {
    if (event.withLoading) {
      emitter(ArticlesLoadingState());
    }
    final result =
        await articlesUseCase.call(ArticlesParams(period: event.period));
    result.fold((l) {
      if (l is CancelTokenFailure) {
        emitter(ArticlesLoadingState());
      } else {
        emitter(ErrorGetArticlesState(l.errorMessage));
      }
    }, (r) {
      allArticles = r;
      emitter(SuccessGetArticlesState(allArticles));
    });
  }
}
