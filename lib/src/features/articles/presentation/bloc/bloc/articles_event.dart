part of 'articles_bloc.dart';

sealed class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object> get props => [];
}

class OnGettingArticlesEvent extends ArticlesEvent {
  final String text;
  final int period;
  final bool withLoading;

  const OnGettingArticlesEvent(this.text, this.period,
      {this.withLoading = true});
}
