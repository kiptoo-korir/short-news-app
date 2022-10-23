import 'package:flutter/material.dart';
import 'package:news_shorts/models/news_item.dart';

class NewsItemProvider extends ChangeNotifier {
  NewsItem _newsItem = NewsItem();

  NewsItem get getNews => _newsItem;

  void setNews(NewsItem news) {
    _newsItem = news;
    notifyListeners();
  }
}
