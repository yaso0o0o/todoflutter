import 'package:flutter/material.dart';
import 'package:flutter_application_1/news_app/model_view/auth_cubit/news_cubit.dart';
import 'package:flutter_application_1/news_app/view/screens/switch_button.dart';
import 'package:flutter_application_1/news_app/view/widgets/news_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TechnologyNewsScreen extends StatelessWidget {
  const TechnologyNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Technology News"),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        buildWhen: (previous , current){
          return current is NewsInitial ||
              current is GetTechnologyNewsLoading||
              current is GetTechnologyNewsSuccess  ||
              current is GetTechnologyNewsError ;
        },
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return ListView.separated(
            itemBuilder: (context, index) {
              return NewsItem(
                newsArticleModel: cubit.getTechnologyNewsList[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 12,
              );
            },
            itemCount: cubit.getTechnologyNewsList.length,
          );
        },
      ),
    );
  }
}
