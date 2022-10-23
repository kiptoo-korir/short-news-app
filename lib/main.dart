import 'package:flutter/material.dart';
import 'package:news_shorts/pages/home_with_tabs_page.dart';
import 'package:news_shorts/providers/news_item_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsItemProvider>(
        create: (context) => NewsItemProvider(),
        child: Consumer<NewsItemProvider>(
            builder: (context, themeProvider, child) => MaterialApp(
                title: 'InShorts News',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    appBarTheme: const AppBarTheme(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black)),
                home: const TabbedHomePage())));
  }
}
