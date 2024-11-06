class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String publishedAt;
  final String source; // Storing only the source name as String

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
    required this.source,
  });

  // Factory method to parse JSON data
  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      imageUrl: json['urlToImage'] ?? 'https://via.placeholder.com/150',
      publishedAt: json['publishedAt'] ?? '',
      source: json['source']?['name'] ?? '', // Extracts nested source name
    );
  }

  // Method to convert the object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': imageUrl,
      'publishedAt': publishedAt,
      'source': {'name': source}, // Store source as a nested object
    };
  }
}
