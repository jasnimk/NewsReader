import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_reader/models/news_model.dart';
import 'package:news_reader/repositories/news_repo.dart';

part 'news_bloc_event.dart';
part 'news_bloc_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<FetchNews>(_onFetchNews);
    on<SearchNews>(_onSearchNews);
    on<ChangeCategory>(_onChangeCategory);
  }
  String currentCategory = "General";
  Future<void> _onFetchNews(FetchNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final List<NewsArticle> articles =
          await newsRepository.fetchNews(event.category);
      emit(NewsLoaded(articles));
    } catch (e) {
      emit(NewsError("Error fetching news: $e"));
    }
  }

  Future<void> _onSearchNews(SearchNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final List<NewsArticle> articles =
          await newsRepository.searchNews(event.query); // Call search function
      emit(NewsLoaded(articles));
    } catch (e) {
      emit(NewsError("Error fetching search results: $e"));
    }
  }

  void _onChangeCategory(ChangeCategory event, Emitter<NewsState> emit) {
    currentCategory = event.category;
    add(FetchNews(category: event.category));
  }
}
