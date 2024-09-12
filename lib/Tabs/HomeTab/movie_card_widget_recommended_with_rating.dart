// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:movies/API/api_manager_homescreen.dart';
// import 'package:movies/Model/TopRatedMoviesModel.dart';
// import 'package:movies/app_colors.dart';
//
// class MovieCardWidgetRecommendedWithRating extends StatefulWidget {
//   final Future<TopRatedMoviesModel?> future;
//   final String headLineText;
//
//   const MovieCardWidgetRecommendedWithRating({required this.future, required this.headLineText});
//
//   @override
//   State<MovieCardWidgetRecommendedWithRating> createState() => _MovieCardWidgetState();
// }
//
// class _MovieCardWidgetState extends State<MovieCardWidgetRecommendedWithRating> {
//   @override
//   Widget build(BuildContext context) {
//     const String imageUrl = "https://image.tmdb.org/t/p/w500";
//
//     return FutureBuilder<TopRatedMoviesModel?>(
//         future: ApiManagerHomeScreen.getTopRatedMovies(),
//         builder: (context, snapshot) {
//           var data = snapshot.data?.results;
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: AppColors.primaryColor,
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Column(
//               children: [
//                 Text('Something went wrong'),
//                 ElevatedButton(
//                     onPressed: () {
//                       ApiManagerHomeScreen.getTopRatedMovies();
//                       setState(() {});
//                     },
//                     child: Text('Try Again'))
//               ],
//             );
//           }
//
//           ///server=> success,error
//           if (snapshot.hasData) {
//             return Padding(
//               padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01,
//                   bottom: MediaQuery.of(context).size.height * 0.01),
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.2102,
//                 color: AppColors.darkgreyColor
//                 ,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(
//                         top: MediaQuery.of(context).size.width * 0.005,
//                         left: MediaQuery.of(context).size.width * 0.02,
//                       ),
//                       child: Text(
//                         widget.headLineText,
//                         style: Theme.of(context).textTheme.titleLarge!.copyWith(
//
//                             fontSize: 15,
//                             color: AppColors.whiteColor),
//                       ),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                           padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
//                           itemCount: data?.length ?? 0,
//                           shrinkWrap: true,
//
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: CachedNetworkImage(
//
//                                   imageUrl: "$imageUrl${data?[index].posterPath}",
//                                 ),
//                               ),
//                             );
//                           }),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           } else {
//             return SizedBox.shrink();
//           }
//
//           // return Column(
//           //   children: [
//           //     Text(
//           //       headLineText,
//           //       style: Theme.of(context).textTheme.titleMedium,
//           //     ),
//           //     SizedBox(height:10),
//           //     Expanded(
//           //       child: ListView.builder(itemCount:data?.length??0,
//           //           shrinkWrap: true,
//           //           scrollDirection: Axis.horizontal,
//           //           itemBuilder: (context,index){
//           //         return Container(
//           //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
//           //           child: CachedNetworkImage(imageUrl: "$imageUrl${data?[index].posterPath}",),
//           //         );
//           //       }),
//           //     )
//           //   ],
//           // );
//         });
//   }
// }
