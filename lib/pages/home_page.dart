import 'package:flutter/material.dart';
import 'package:news_shorts/models/news_item.dart';
import 'package:news_shorts/pages/specific_news.dart';
import 'package:news_shorts/providers/news_item_provider.dart';
import 'package:news_shorts/services/news_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsItemProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('InShortNews'),
      ),
      body: FutureBuilder(
          future: NewsService.readJson(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(
                child: Text('${data.error}'),
              );
            }
            var newsItems = data.data as List<NewsItem>;
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
                          child:
                              Image.network(newsItems[i].imageUrl.toString()),
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
          }),
    );
  }
}
