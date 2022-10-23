import 'package:flutter/material.dart';
import 'package:news_shorts/providers/news_item_provider.dart';
import 'package:provider/provider.dart';

class SpecificNews extends StatefulWidget {
  const SpecificNews({Key? key}) : super(key: key);

  @override
  State<SpecificNews> createState() => _SpecificNewsState();
}

class _SpecificNewsState extends State<SpecificNews> {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsItemProvider>(context);
    final newsItem = newsProvider.getNews;

    return Scaffold(
      appBar: AppBar(
        title: const Text('InShortNews'),
      ),
      body: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: SingleChildScrollView(
            child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: Image.network(newsItem.imageUrl.toString()),
            ),
            ListTile(
              title: Text(
                newsItem.title.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                newsItem.content.toString(),
                style: const TextStyle(wordSpacing: 1.0, fontSize: 16),
              ),
            )
          ],
        )),
      ),
    );
  }
}
