// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:movies/API/api_constants.dart';
// import 'package:movies/API/api_manager_homescreen.dart';
// import 'package:movies/Model/NewReleasesModel.dart';
// import 'package:movies/Model/PopularMoviesModel.dart';
// import 'package:movies/Model/TopRatedMoviesModel.dart';
// import 'package:movies/Tabs/HomeTab/movie_card_widget.dart';
// import 'package:movies/Tabs/HomeTab/movie_card_widget_Popular.dart';
// import 'package:movies/Tabs/HomeTab/movie_card_widget_recommended.dart';
// import 'package:movies/app_colors.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// class HomeTab extends StatefulWidget {
//   static const String routeName = 'home_tab';
//
//   @override
//   State<HomeTab> createState() => _HomeTabState();
// }
//
// class _HomeTabState extends State<HomeTab> {
//   late Future<NewReleasesModel?> newReleases;
//   late Future<TopRatedMoviesModel?> recommended;
//   late Future<PopularMoviesModel?> popular;
//
//   ApiManagerHomeScreen apiManagerHomeScreen = ApiManagerHomeScreen();
//
//   @override
//   void initState() {
//     super.initState();
//     newReleases = ApiManagerHomeScreen.getNewReleasesMovie();
//     recommended = ApiManagerHomeScreen.getTopRatedMovies();
//     popular = ApiManagerHomeScreen.getPopularMovies();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const String imageUrl = "https://image.tmdb.org/t/p/w500";
//
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       body: Column(
//         children: [
//           Expanded(
//             // Wrap with Expanded to give the Column proper constraints
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   FutureBuilder<PopularMoviesModel?>(
//                       future: ApiManagerHomeScreen.getPopularMovies(),
//                       builder: (context, snapshot) {
//                         var data = snapshot.data?.results;
//
//                         if (snapshot.connectionState == ConnectionState.waiting) {
//                           return Center(
//                             child: CircularProgressIndicator(
//                               color: AppColors.primaryColor,
//                             ),
//                           );
//                         } else if (snapshot.hasError) {
//                           return Column(
//                             children: [
//                               Text('Something went wrong'),
//                               ElevatedButton(
//                                   onPressed: () {
//                                     ApiManagerHomeScreen.getPopularMovies();
//                                     setState(() {});
//                                   },
//                                   child: Text('Try Again'))
//                             ],
//                           );
//                         }
//
//                         if (snapshot.hasData && data != null) {
//                           return MovieCardWidgetPopular(data: snapshot.data!);
//                         } else {
//                           return SizedBox.shrink();
//                         }
//                       }),
//                   MovieCardWidget(
//                     future: newReleases,
//                     headLineText: "New Releases",
//                   ),
//                   SizedBox(height: 10), // Add spacing if needed
//                   MovieCardWidgetRecommended(
//                     future: recommended,
//                     headLineText: "Recommended",
//                   ),
//                 ],
//               ),
//           ),
//           SizedBox(height: 10),
//           ),
//         ],
//       ),
//     );
//   }
// }
