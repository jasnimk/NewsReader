import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_reader/models/news_model.dart';

class NewsApiService {
  static const String _apiKey = "557ebd9af5e543a4a4e492fc29a8c55b";
  //static const String _apiKey = "b30de1abf0f44dd3a988fb89a04607b0";
  //static const String _apiKey = "7b3af7c9c3cd4d488b9f27b05276c897";
  static const String _baseUrl = "https://newsapi.org/v2/top-headlines";
  static const String _everythingUrl = "https://newsapi.org/v2/everything";

  Future<List<NewsArticle>> fetchNewsByCategory(String category) async {
    final url =
        Uri.parse("$_baseUrl?apiKey=$_apiKey&category=$category&country=us");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> articlesJson = data['articles'];
      return articlesJson.map((json) => NewsArticle.fromJson(json)).toList();
    } else if (response.statusCode == 429) {
      throw Exception("Too many requests: Please wait before trying again.");
    } else {
      throw Exception("Failed to fetch news for category: $category");
    }
  }

  Future<List<NewsArticle>> searchNews(String query) async {
    final url = Uri.parse(
        "$_everythingUrl?apiKey=$_apiKey&q=$query&language=en&sortBy=relevancy");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> articlesJson = data['articles'];
      return articlesJson.map((json) => NewsArticle.fromJson(json)).toList();
    } else if (response.statusCode == 429) {
      throw Exception("Too many requests: Please wait before trying again.");
    } else {
      throw Exception("Failed to search news with query: $query");
    }
  }
}
