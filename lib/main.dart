import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/chach_helper.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/logic/bloc_Observer.dart';
import 'package:flutter_application_1/logic/task_cubit.dart';
import 'package:flutter_application_1/news_app/core/theme/app_theme.dart';
import 'package:flutter_application_1/news_app/model_view/auth_cubit/news_cubit.dart';
import 'package:flutter_application_1/news_app/view/screens/app_layout.dart';
import 'package:flutter_application_1/news_app/view/screens/splash_screen.dart';
import 'package:flutter_application_1/tast/FacebookLogin.dart';
import 'package:flutter_application_1/tast/Messenger.dart';
import 'package:flutter_application_1/tast/SplashScreen.dart';
import 'package:flutter_application_1/todo_app_screens/todo_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/tast/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.initDio();

  Bloc.observer = MyBlocObserver();

  await CacheHelper.initSharedPref();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(

           // create: (context) =>  TaskCubit()..initDatabase()
           create: (context) => NewsCubit()
            ..getBusinessNews()
            ..getGeneralNews()
            ..getTechnologyNews(),
        ),
      ],
      child: const NewsApp(),
    );
  }
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  bool isDarkMode = false;

  void _toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   title: "ToDo List APP",
    //   home: SplashScreen(),
    // );
     return MaterialApp(
       home: Facebooklogin(),
      //  title: "News App",
      //  theme: AppTheme.getLightTheme(),
      //  darkTheme: AppTheme.getDarkTheme(),
      // themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      //  home: SplashScreenNews(onThemeChanged: _toggleTheme),
    );
  }
}
