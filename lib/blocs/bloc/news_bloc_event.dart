part of 'news_bloc_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchNews extends NewsEvent {
  final String category;

  FetchNews({required this.category});

  @override
  List<Object?> get props => [category];
}

class SearchNews extends NewsEvent {
  final String query;

  SearchNews({required this.query});

  @override
  List<Object?> get props => [query];
}

class ChangeCategory extends NewsEvent {
  final String category;
  ChangeCategory({required this.category});
}
