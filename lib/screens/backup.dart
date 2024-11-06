

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:news_reader/blocs/bloc/news_bloc_bloc.dart';
// // import 'package:news_reader/widgets/home_news_card.dart';

// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     // Dispatching the fetch news event only once
// //     context.read<NewsBloc>().add(FetchNews(category: "general"));

// //     return Scaffold(
// //       appBar: AppBar(title: Text("Home")),
// //       body: BlocBuilder<NewsBloc, NewsState>(
// //         builder: (context, state) {
// //           if (state is NewsLoading) {
// //             return Center(child: CircularProgressIndicator());
// //           } else if (state is NewsLoaded) {
// //             final articles = state.articles; // Get the articles

// //             // Pass the entire articles list to HomeNewsCard
// //             return HomeNewsCard(articles: articles);
// //           } else if (state is NewsError) {
// //             return Center(child: Text(state.message));
// //           }
// //           return Container();
// //         },
// //       ),
// //     );
// //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:news_reader/blocs/bloc/news_bloc_bloc.dart';
// // import 'package:news_reader/widgets/home_news_card.dart';

// // class HomeScreen extends StatefulWidget {
// //   @override
// //   _HomeScreenState createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen>
// //     with SingleTickerProviderStateMixin {
// //   late TabController _tabController;
// //   final List<String> categories = [
// //     "General",
// //     "Technology",
// //     "Science",
// //     "Health",
// //     "Sports"
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: categories.length, vsync: this);
// //     _fetchNewsForCategory(
// //         categories[0]); // Fetch news for the first category by default

// //     _tabController.addListener(() {
// //       if (_tabController.indexIsChanging) {
// //         _fetchNewsForCategory(categories[_tabController.index]);
// //       }
// //     });
// //   }

// //   void _fetchNewsForCategory(String category) {
// //     context.read<NewsBloc>().add(FetchNews(category: category));
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Home"),
// //         bottom: TabBar(
// //           controller: _tabController,
// //           isScrollable: true,
// //           tabs: categories.map((category) => Tab(text: category)).toList(),
// //         ),
// //       ),
// //       body: BlocBuilder<NewsBloc, NewsState>(
// //         builder: (context, state) {
// //           if (state is NewsLoading) {
// //             return Center(child: CircularProgressIndicator());
// //           } else if (state is NewsLoaded) {
// //             final articles = state.articles; // Get the articles

// //             // Pass the entire articles list to HomeNewsCard
// //             return HomeNewsCard(articles: articles);
// //           } else if (state is NewsError) {
// //             return Center(child: Text(state.message));
// //           }
// //           return Container();
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_reader/blocs/bloc/news_bloc_bloc.dart';
// import 'package:news_reader/widgets/home_news_card.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final List<String> categories = [
//     "General",
//     "Technology",
//     "Science",
//     "Health",
//     "Sports"
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: categories.length, vsync: this);
//     _fetchNewsForCategory(categories[0]);

//     // Add listener to rebuild UI when tab changes
//     _tabController.addListener(() {
//       if (_tabController.indexIsChanging) {
//         _fetchNewsForCategory(categories[_tabController.index]);
//         setState(() {}); // Trigger rebuild to update tab styles
//       }
//     });
//   }

//   void _fetchNewsForCategory(String category) {
//     context.read<NewsBloc>().add(FetchNews(category: category));
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 8.0),
//             child: StatefulBuilder(
//               builder: (context, setState) {
//                 return TabBar(
//                   controller: _tabController,
//                   isScrollable: true,
//                   labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   indicator: const BoxDecoration(),
//                   dividerColor: Colors.transparent,
//                   onTap: (index) {
//                     setState(() {});
//                   },
//                   tabs: List.generate(
//                     categories.length,
//                     (index) => Tab(
//                       height: 35,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15.0),
//                           color: _tabController.index == index
//                               ? Colors.blue
//                               : Colors.transparent,
//                           border: Border.all(
//                             color: Colors.blue,
//                             width: 1.5,
//                           ),
//                         ),
//                         child: Center(
//                           child: Text(
//                             categories[index],
//                             style: TextStyle(
//                               color: _tabController.index == index
//                                   ? Colors.white
//                                   : Colors.blue,
//                               fontWeight: _tabController.index == index
//                                   ? FontWeight.bold
//                                   : FontWeight.normal,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             child: TabBarView(
//               // Add TabBarView to show content
//               controller: _tabController,
//               children: List.generate(
//                 categories.length,
//                 (index) => BlocBuilder<NewsBloc, NewsState>(
//                   builder: (context, state) {
//                     if (state is NewsLoading) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else if (state is NewsLoaded) {
//                       return HomeNewsCard(articles: state.articles);
//                     } else if (state is NewsError) {
//                       return Center(child: Text(state.message));
//                     }
//                     return Container();
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:news_reader/screens/home_screen.dart';
// import 'package:news_reader/screens/science_screen.dart';
// import 'package:news_reader/screens/search_result.dart';
// import 'package:news_reader/screens/tech_screen.dart';
// import 'package:news_reader/screens/trending_screen.dart';
// import 'package:news_reader/widgets/bottom_nav_bar.dart';

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;
//   final TextEditingController _searchController = TextEditingController();
//   bool _isSearching = false;

//   final List<Widget> _screens = [
//     HomeScreen(),
//     TrendingScreen(),
//     TechnologyScreen(),
//     ScienceScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       _isSearching = false;
//     });
//   }

//   void _onSearch(String query) {
//     if (query.isNotEmpty) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => SearchResultsScreen(query: query),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: _isSearching
//             ? TextField(
//                 controller: _searchController,
//                 autofocus: true,
//                 decoration: InputDecoration(
//                   hintText: "Search news...",
//                   border: InputBorder.none,
//                 ),
//                 onSubmitted: _onSearch,
//               )
//             : Text("News Reader"),
//         actions: [
//           IconButton(
//             icon: Icon(_isSearching ? Icons.close : Icons.search),
//             onPressed: () {
//               setState(() {
//                 _isSearching = !_isSearching;
//                 if (!_isSearching) _searchController.clear();
//               });
//             },
//           ),
//         ],
//       ),
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavBar(
//         selectedIndex: _selectedIndex,
//         onItemTapped: _onItemTapped,
//       ),
//     );
//   }
// }