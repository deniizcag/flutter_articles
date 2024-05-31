part of 'articles_bloc.dart';

sealed class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

final class ArticlesInitialState extends ArticlesState {}

final class ArticlesLoadingState extends ArticlesState {}

class ErrorGetArticlesState extends ArticlesState {
  final String errorMessage;

  const ErrorGetArticlesState(this.errorMessage);
}

class SuccessGetArticlesState extends ArticlesState {
  final List<ArticleModel> articles;

  const SuccessGetArticlesState(this.articles);
}
