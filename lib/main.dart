import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/blocs/bloc/news_bloc_bloc.dart';
import 'package:news_reader/repositories/news_repo.dart';
import 'package:news_reader/screens/splash_screen.dart';

void main() {
  final newsRepository = NewsRepository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NewsBloc(newsRepository)),
      ],
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Reader',
      //theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
