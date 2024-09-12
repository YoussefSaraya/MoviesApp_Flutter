// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:movies/Model/PopularMoviesModel.dart';
// import 'package:movies/app_colors.dart';
//
// class MovieCardWidgetPopular extends StatelessWidget {
//   final Results results;
//
//
//   MovieCardWidgetPopular({required this.results});
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     const String imageUrl = "https://image.tmdb.org/t/p/w500";
//
//     return Stack(
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.28, // Ensure this matches CarouselSlider height for consistency
//           child: CachedNetworkImage(
//                 imageUrl: "$imageUrl${results.backdropPath}",
//                 fit: BoxFit.cover,
//       placeholder: (context,url) => const Center(
//           child: Icon(
//             Icons.error,
//             color: AppColors.goldColor,
//           ),
//
//       ),// Ensures images fill the space appropriately
//               ),
//           ),
//     Padding(
//       padding:EdgeInsets.only(
//     bottom: MediaQuery.of(context).size.height * 0.01,
//     top: MediaQuery.of(context).size.height * 0.12,
//     left: MediaQuery.of(context).size.height * 0.015,
//     right: MediaQuery.of(context).size.width * 0.6,
//     ),
//       child: ClipRRect(
//       borderRadius: BorderRadius.circular(8),
//       child: GestureDetector(onTap: (){
//
//       },
//       child: CachedNetworkImage(
//         height: MediaQuery.of(context).size.height * 0.25,
//       imageUrl: "$imageUrl${results.posterPath}",
//       placeholder: (context,url)=>const Center(
//       child: CircularProgressIndicator(
//       color: AppColors.goldColor,
//       ),
//       ),
//       errorWidget: (context, url, error) => const Center(
//       child: Icon(
//       Icons.error,
//       color: AppColors.goldColor,
//       )),
//       ),
//
//       )
//           ),
//     ),
//     Padding(
//       padding:  EdgeInsets.only(
//           top: MediaQuery.of(context).size.height * 0.30,
//           left: MediaQuery.of(context).size.width * 0.43),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//       Text(results.title!,
//       style: Theme.of(context)
//           .textTheme
//           .titleLarge
//           ?.copyWith(color: AppColors.whiteColor,fontSize: 20)),
//       SizedBox(
//       height: MediaQuery.of(context).size.height * 0.01,
//       ),
//       Text(results.releaseDate!,
//       style: Theme.of(context)
//           .textTheme
//           .titleMedium
//           ?.copyWith(color: AppColors.whiteColor, fontSize: 15)),
//
//
//       ],),
//     )
//
//       ],
//
//     );
//   }
// }
