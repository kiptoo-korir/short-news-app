import 'package:news_shorts/models/news_item.dart';
import 'package:news_shorts/pages/specific_news.dart';
import 'package:news_shorts/providers/news_item_provider.dart';
import 'package:news_shorts/services/news_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class NewsItemsList extends StatefulWidget {
  const NewsItemsList({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  State<NewsItemsList> createState() => _NewsItemsListState();
}

class _NewsItemsListState extends State<NewsItemsList> {
  Future<List<NewsItem>>? _newsItemsList;

  @override
  void initState() {
    super.initState();
    _newsItemsList = NewsService.readJsonMultipleCategories(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsItemProvider>(context);

    return FutureBuilder(
      future: _newsItemsList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }

          var newsItems = snapshot.data as List<NewsItem>;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: newsItems.length,
            itemBuilder: (context, i) {
              return InkWell(
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        child: Image.network(newsItems[i].imageUrl.toString()),
                      ),
                      ListTile(
                        title: Text(
                          newsItems[i].title.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  newsProvider.setNews(newsItems[i]);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SpecificNews()));
                },
              );
            },
          );
        }

        return Text('State: ${snapshot.connectionState}');
      },
    );
  }
}
