import 'package:flutter/material.dart';
import 'package:flutter_application_1/news_app/model_view/auth_cubit/news_cubit.dart';
import 'package:flutter_application_1/news_app/view/screens/switch_button.dart';
import 'package:flutter_application_1/news_app/view/widgets/news_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

class BusinessNewsScreen extends StatelessWidget {
  const BusinessNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business News"),

      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        buildWhen: (previous , current){
          return current is NewsInitial ||
          current is GetBusinessNewsLoading ||
          current is GetBusinessNewsSuccess ||
          current is GetBusinessNewsError ;
        },
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return ListView.separated(
            itemBuilder: (context, index) {
              return NewsItem(
                newsArticleModel: cubit.getBusinessNewsList[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 12,
              );
            },
            itemCount: cubit.getBusinessNewsList.length,
          );
        },
      ),
    );
  }
}