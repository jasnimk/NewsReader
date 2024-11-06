import 'package:news_reader/models/news_model.dart';
import 'package:news_reader/services/api_service.dart';

class NewsRepository {
  final NewsApiService _newsApiService = NewsApiService();

  Future<List<NewsArticle>> fetchNews(String category) async {
    try {
      // Directly return the list of NewsArticle from the service
      return await _newsApiService.fetchNewsByCategory(category);
    } catch (e) {
      throw Exception("Failed to load news: $e");
    }
  }

  Future<List<NewsArticle>> searchNews(String query) async {
    try {
      // Fetch news by search query using the service
      return await _newsApiService.searchNews(query);
    } catch (e) {
      throw Exception("Failed to search news: $e");
    }
  }
}
