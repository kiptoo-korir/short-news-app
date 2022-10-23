import 'package:flutter/services.dart';
import 'package:news_shorts/models/news.dart';
import 'dart:convert';

import 'package:news_shorts/models/news_item.dart';

class NewsService {
  static Future<List<NewsItem>> readJson() async {
    final String response = await rootBundle.loadString('assets/news.json');
    final Map<String, dynamic> data = await json.decode(response);
    final List newsList = data['data'];

    return newsList.map((newsItem) => NewsItem.fromJson(newsItem)).toList();
  }

  static Future<List<NewsItem>> readJsonMultipleCategories(
      String category) async {
    final String response =
        await rootBundle.loadString('assets/news_multiple_categories.json');
    final List<dynamic> data = await json.decode(response);

    final List<News> newsListParsed =
        data.map((news) => News.fromJSON(news)).toList();

    final News newsInCategory =
        newsListParsed.where((news) => news.category == category).first;

    if (newsInCategory.data == null) {
      return <NewsItem>[];
    }

    return newsInCategory.data as List<NewsItem>;
  }
}
