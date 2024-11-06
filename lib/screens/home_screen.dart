import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/blocs/bloc/news_bloc_bloc.dart';
import 'package:news_reader/widgets/home_news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> categories = [
    "General",
    "Technology",
    "Science",
    "Health",
    "Sports",
    "Entertainment"
  ];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
    context.read<NewsBloc>().add(FetchNews(category: categories[0]));

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) return;
      final category = categories[_tabController.index];
      context.read<NewsBloc>().add(FetchNews(category: category));
      setState(() {
        selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Prism",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 9, 11, 46),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              indicator: const BoxDecoration(),
              dividerColor: Colors.transparent,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              tabs: List.generate(
                categories.length,
                (index) => Tab(
                  height: 35,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: selectedIndex == index
                          ? const Color.fromARGB(255, 9, 11, 46)
                          : Colors.transparent,
                      border: Border.all(
                        color: const Color.fromARGB(255, 9, 11, 46),
                        width: 1.5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: BlocListener<NewsBloc, NewsState>(
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
                  return HomeNewsCard(articles: state.articles);
                }
                return Container();
                // Expanded(
                //   child: BlocBuilder<NewsBloc, NewsState>(
                //     builder: (context, state) {
                //       if (state is NewsLoading) {
                //         return const Center(child: CircularProgressIndicator());
                //       } else if (state is NewsLoaded) {
                //         return HomeNewsCard(articles: state.articles);
                //       } else if (state is NewsError) {
                //         return Center(child: Text(state.message));
                //       }
                //       return Container();
              },
            ),
          )),
        ],
      ),
    );
  }
}
