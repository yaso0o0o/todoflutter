import 'package:flutter/material.dart';
import 'package:flutter_application_1/news_app/model/models/news_article_model.dart';
import 'package:flutter_application_1/news_app/view/screens/news_web_view_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class NewsItem extends StatelessWidget {
  final NewsArticle newsArticleModel;

  const NewsItem({super.key, required this.newsArticleModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: newsArticleModel.url != null
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsWebViewScreen(
                      url: newsArticleModel.url!,
                    ),
                  ),
                );
              }
            : null,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: const Offset(0, 4),
                blurRadius: 8,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl: newsArticleModel.urlToImage ?? "",
                  fit: BoxFit.cover,
                  placeholder: (context, value) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[200]!,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  },
                  errorWidget: (context, value, object) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[200]!,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    newsArticleModel.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                  ),
                  Text(
                    newsArticleModel.description ?? "",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                  ),
                  Text(
                    newsArticleModel.publishedAt?.toString() ?? "",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
