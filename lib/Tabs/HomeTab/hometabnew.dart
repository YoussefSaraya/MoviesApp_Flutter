import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/API/api_constants.dart';
import 'package:movies/API/api_manager_homescreen.dart';
import 'package:movies/Model/NewReleasesModel.dart';
import 'package:movies/Model/PopularMoviesModel.dart';
import 'package:movies/Model/TopRatedMoviesModel.dart';
import 'package:movies/Tabs/HomeTab/ItemSlider.dart';
import 'package:movies/Tabs/HomeTab/Slider.dart';
import 'package:movies/Tabs/HomeTab/movie_card_widget.dart';
import 'package:movies/Tabs/HomeTab/movie_card_widget_Popular.dart';
import 'package:movies/Tabs/HomeTab/movie_card_widget_recommended.dart';
import 'package:movies/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeTabNew extends StatefulWidget {
  static const String routeName = 'home_tab_new';

  @override
  State<HomeTabNew> createState() => _HomeTabNewState();
}

class _HomeTabNewState extends State<HomeTabNew> {
  late Future<NewReleasesModel?> newReleases;
  late Future<TopRatedMoviesModel?> recommended;
  late Future<PopularMoviesModel?> popular;

  ApiManagerHomeScreen apiManagerHomeScreen = ApiManagerHomeScreen();

  @override
  void initState() {
    super.initState();
    newReleases = ApiManagerHomeScreen.getNewReleasesMovie();
    recommended = ApiManagerHomeScreen.getTopRatedMovies();
    popular = ApiManagerHomeScreen.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    const String imageUrl = "https://image.tmdb.org/t/p/w500";

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Expanded(
              // Wrap with Expanded to give the Column proper constraints
              child: SliderMovies()),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
           NewReleasesMovieCardWidget(future: newReleases, headLineText: "New Releases"),
          RecommendedMovieCardWidget(future: recommended, headLineText: "Recommended")
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.25,
          //   color: AppColors.darkgreyColor,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.only(
          //           top: MediaQuery.of(context).size.width * 0.005,
          //           left: MediaQuery.of(context).size.width * 0.02,
          //         ),
          //         child: Text(
          //           'New Releases',
          //           style: Theme.of(context)
          //               .textTheme
          //               .titleLarge
          //               ?.copyWith(color: AppColors.whiteColor),
          //         ),
          //       ),
          //       const MovieCardWidgetTest()
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
