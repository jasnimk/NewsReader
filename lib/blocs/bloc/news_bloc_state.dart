part of 'news_bloc_bloc.dart';

@immutable
abstract class NewsState extends Equatable {
  final String currentCategory;
  const NewsState({this.currentCategory = "General"});

  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<NewsArticle> articles;

  NewsLoaded(this.articles);

  @override
  List<Object?> get props => [articles];
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);

  @override
  List<Object?> get props => [message];
}
