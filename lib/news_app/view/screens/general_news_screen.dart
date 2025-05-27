import 'package:flutter/material.dart';
import 'package:flutter_application_1/news_app/model_view/auth_cubit/news_cubit.dart';
import 'package:flutter_application_1/news_app/model_view/auth_cubit/news_cubit.dart';
import 'package:flutter_application_1/news_app/view/screens/switch_button.dart';
import 'package:flutter_application_1/news_app/view/widgets/news_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralNewsScreen extends StatelessWidget {
  const GeneralNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("General News"),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        buildWhen: (previous , current){
          return current is NewsInitial ||
              current is GetGeneralNewsLoading ||
              current is GetGeneralNewsSuccess ||
              current is GetGeneralNewsError ;
        },
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return ListView.separated(
            itemBuilder: (context, index) {
              return NewsItem(
                newsArticleModel: cubit.getGeneralNewsList[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 12,
              );
            },
            itemCount: cubit.getGeneralNewsList.length,
          );
        },
      ),
    );
  }
}
