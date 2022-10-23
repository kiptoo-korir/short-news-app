import 'package:news_shorts/models/news_item.dart';

class News {
  final String? category;
  final List<NewsItem>? data;

  News({this.category, this.data});

  factory News.fromJSON(Map<String, dynamic> data) {
    final category = data['category'] as String;
    final newsListData = data['data'] as List<dynamic>?;

    final newsList = (newsListData != null)
        ? newsListData.map((news) => NewsItem.fromJson(news)).toList()
        : <NewsItem>[];

    return News(category: category, data: newsList);
  }
}
