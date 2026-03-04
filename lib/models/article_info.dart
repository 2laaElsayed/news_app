class ArticleModel {
  final List<Article>? articles;

  ArticleModel({this.articles});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    articles: json["articles"] == null
        ? []
        : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
  );
}

class Article {
  final String? writer;
  final String? headLine;
  final String? description;
  final String? thumbUrl;
  final DateTime? date;
  final String? body;

  Article({
    this.writer,
    this.headLine,
    this.description,
    this.thumbUrl,
    this.date,
    this.body,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    writer: json["author"] ?? "Unknown",
    headLine: json["title"],
    description: json["description"],
    thumbUrl: json["urlToImage"],
    date: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    body: json["content"],
  );
}