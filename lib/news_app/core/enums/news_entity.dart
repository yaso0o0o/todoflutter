class NewsEntity {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;
  final String? url;

  NewsEntity(
      {required this.publishedAt,
      required this.url,
      required this.title,
      required this.description,
      required this.urlToImage});
}
