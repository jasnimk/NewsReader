import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/blocs/bloc/news_bloc_bloc.dart';
import 'package:news_reader/widgets/news_card.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(FetchNews(category: "health"));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Health",
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.indigo[800],
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return NewsCard(article: state.articles[index]);
              },
            );
          } else if (state is NewsError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
