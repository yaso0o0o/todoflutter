import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/news_app/model/data_source/news_remote_data_source.dart';
import 'package:flutter_application_1/news_app/model/models/news_article_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  final NewsData _newsData = NewsData();

  static NewsCubit get(context) => BlocProvider.of(context);
  List<NewsArticle>  getGeneralNewsList = [];
  List<NewsArticle>  getBusinessNewsList = [];
  List<NewsArticle>  getTechnologyNewsList = [];

  void getGeneralNews() async {
    emit(GetGeneralNewsLoading());
    try{
      final  response = await _newsData.getNews(category: 'general');
      getGeneralNewsList = response;
      emit(GetGeneralNewsSuccess());
    }catch(error){
      emit(GetGeneralNewsError());
      print(error);
    }
  }

  void getBusinessNews() async {
    emit(GetBusinessNewsLoading());
    try{
      final  response = await _newsData.getNews(category: 'business');
      getBusinessNewsList = response;
      emit(GetBusinessNewsSuccess());
    }catch(error){
      emit(GetBusinessNewsError());
    }
  }

  void getTechnologyNews() async {
    emit(GetTechnologyNewsLoading());
    try{
      final  response = await _newsData.getNews(category: 'technology');
      getTechnologyNewsList = response;
      emit(GetTechnologyNewsSuccess());
    }catch(error){
      emit(GetTechnologyNewsError());
    }
  }
}
