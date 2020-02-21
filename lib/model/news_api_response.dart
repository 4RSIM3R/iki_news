class NewsApiResponse {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  NewsApiResponse({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory NewsApiResponse.fromJson(Map<String, dynamic> json) => NewsApiResponse(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}

class Source {
  dynamic id;
  String name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}
