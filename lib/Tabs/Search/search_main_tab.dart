
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/API/api_manager_search.dart';
import 'package:movies/Model/MovieSearch.dart';
import 'package:movies/Model/draft_response.dart';
import 'package:movies/Tabs/Search/search_bar.dart';
import 'package:movies/Tabs/Search/search_item.dart';
import 'package:movies/app_colors.dart';

class SearchMainTab extends StatefulWidget {
  const SearchMainTab({super.key});
  static const String routeName = 'search_main_tab';


  @override
  State<SearchMainTab> createState() => _SearchMainTabState();
}
class _SearchMainTabState extends State<SearchMainTab> {
  Future<MovieSearch?>? movies;
  TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    String imageUrl = 'https://image.tmdb.org/t/p/w500';
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.01,
                right: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.height * 0.02
            ),
            child: SearchTopBar(onSearch: searchMovies),
          ),
          Expanded(
            child: SearchItem(movies: movies,),
          ),
        ]));
  }
  void searchMovies(String query) {
    setState(() {
      movies = ApiManagerSearch.getSearchedMovie(query);
    });
  }
}