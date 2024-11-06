// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_reader/blocs/bloc/news_bloc_bloc.dart';
// import 'package:news_reader/widgets/news_card.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<NewsBloc>().add(FetchNews(category: "general"));
//   }

//   void _onSearchChanged(String query) {
//     setState(() {});
//     if (query.isNotEmpty) {
//       context.read<NewsBloc>().add(FetchNews(category: query));
//     } else {
//       context.read<NewsBloc>().add(FetchNews(category: "general"));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: CupertinoSearchTextField(
//           onChanged: _onSearchChanged,
//           placeholder: 'Search news...',
//         ),
//       ),
//       body: BlocBuilder<NewsBloc, NewsState>(
//         builder: (context, state) {
//           if (state is NewsLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is NewsLoaded) {
//             return ListView.builder(
//               itemCount: state.articles.length,
//               itemBuilder: (context, index) {
//                 return NewsCard(article: state.articles[index]);
//               },
//             );
//           } else if (state is NewsError) {
//             return Center(child: Text(state.message));
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/blocs/bloc/news_bloc_bloc.dart';
import 'package:news_reader/widgets/news_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(FetchNews(category: "general"));
  }

  void _onSearchChanged(String query) {
    setState(() {});
    if (query.isNotEmpty) {
      context.read<NewsBloc>().add(FetchNews(category: query));
    } else {
      context.read<NewsBloc>().add(FetchNews(category: "general"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CupertinoSearchTextField(
          onChanged: _onSearchChanged,
          placeholder: 'Search news...',
        ),
      ),
      body: BlocListener<NewsBloc, NewsState>(
        listener: (context, state) {
          if (state is NewsError) {
            // Show the Snackbar with the error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<NewsBloc, NewsState>(
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
      ),
    );
  }
}
