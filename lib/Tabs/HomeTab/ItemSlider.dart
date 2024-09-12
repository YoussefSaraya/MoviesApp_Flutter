//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:movies/Tabs/HomeTab/movie_card_widget_Popular.dart';
//
// import '../../Model/PopularMoviesModel.dart';
//
// class ItemSlider extends StatelessWidget {
//   List<Results> resultsList;
//
//   ItemSlider({super.key, required this.resultsList});
//
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//         items: resultsList
//             .map((result) => MovieCardWidgetPopular(results: result))
//             .toList(),
//         options: CarouselOptions(
//             viewportFraction: 1, autoPlay: true, height: double.infinity));
//   }
// }
