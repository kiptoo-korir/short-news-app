class NewsItem {
  final String? author;
  final String? content;
  final String? imageUrl;
  final String? date;
  final String? readMoreUrl;
  final String? time;
  final String? title;
  final String? url;

  NewsItem(
      {this.author,
      this.content,
      this.imageUrl,
      this.date,
      this.readMoreUrl,
      this.time,
      this.title,
      this.url});

  NewsItem.fromJson(Map<String, dynamic> json)
      : author = json['author'],
        content = json['content'],
        imageUrl = json['imageUrl'],
        date = json['date'],
        readMoreUrl = json['readMoreUrl'],
        time = json['time'],
        title = json['title'],
        url = json['url'];

  Map<String, dynamic> toJson() => {
        'author': author,
        'content': content,
        'imageUrl': imageUrl,
        'date': date,
        'readMoreUrl': readMoreUrl,
        'time': time,
        'title': title,
        'url': url
      };
}
