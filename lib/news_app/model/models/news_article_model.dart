class NewsArticle {
  final String? id;
  final String? name;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  NewsArticle({
    this.id,
    this.name,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory NewsArticle.fromMap(Map<String, dynamic> map) {
    return NewsArticle(
      id: map['source']?['id'],
      name: map['source']?['name'],
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'] != null
          ? DateTime.tryParse(map['publishedAt'])
          : null,
      content: map['content'],
    );
  }
}
