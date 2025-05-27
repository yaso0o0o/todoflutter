import 'package:dio/dio.dart';
import 'package:flutter_application_1/news_app/model/models/news_article_model.dart';
import 'package:flutter_application_1/tast/network/dio_helper.dart';
import 'package:flutter_application_1/tast/network/end_point.dart';

class NewsData {
  Future<List<NewsArticle>> getNews({required String category}) async {
    try {
      final Response response =
          await DioHelper.getData(endPointPath: EndPoints.topHeadlines,
          queryParameters: {
            "category" : category ,
            "apiKey" : "8b1bf4dca8ea4346ba097b9f00bf9a06",
          });
      return List<NewsArticle>.from(
          response.data["articles"].map((item) => NewsArticle.fromMap(item)));
    } catch (error) {
      rethrow;
    }
  }
}
