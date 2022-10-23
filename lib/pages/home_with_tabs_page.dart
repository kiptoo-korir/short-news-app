import 'package:flutter/material.dart';
import 'package:news_shorts/pages/news_items_list.dart';

class TabbedHomePage extends StatelessWidget {
  const TabbedHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                    child: Text(
                  "Business News",
                  style: TextStyle(color: Colors.black),
                )),
                Tab(
                    child: Text("Technology News",
                        style: TextStyle(color: Colors.black))),
                Tab(
                    child: Text("Sports News",
                        style: TextStyle(color: Colors.black))),
                Tab(
                    child: Text("World News",
                        style: TextStyle(color: Colors.black))),
                Tab(
                    child: Text("Startup News",
                        style: TextStyle(color: Colors.black))),
              ],
              isScrollable: true,
            ),
            title: const Text('InShortNews'),
          ),
          body: const TabBarView(children: [
            NewsItemsList(category: 'business'),
            NewsItemsList(category: 'technology'),
            NewsItemsList(category: 'sports'),
            NewsItemsList(category: 'world'),
            NewsItemsList(category: 'startup'),
          ]),
        ));
  }
}
