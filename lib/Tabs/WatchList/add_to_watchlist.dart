// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:movies/Tabs/WatchList/main_results.dart';
//
// import '../../app_colors.dart';
// import 'Main_Results.dart';
//
// class FavoriteFunc extends StatefulWidget {
//   final MainResults results;
//
//   const FavoriteFunc({required this.results});
//
//   @override
//   State<FavoriteFunc> createState() => _FavoriteFuncState();
// }
//
// class _FavoriteFuncState extends State<FavoriteFunc> {
//   bool isFavorite = false;
//
//   void _toggleFavorite() {
//     if (isFavorite) {
//       _removeFromWatchList();
//     } else {
//       _addToWatchList();
//     }
//
//     setState(() {
//       isFavorite = !isFavorite;
//     });
//   }
//
//   void _addToWatchList() async {
//     try {
//       final movieData = {
//         'title': widget.results.title,
//         'posterPath': widget.results.posterPath,
//         'releaseDate': widget.results.releaseDate,
//         'id': widget.results.id,
//       };
//
//       await FirebaseFirestore.instance
//           .collection('MoviesFavorites')
//           .doc(widget.results.id
//           .toString()) // Assuming 'id' is the unique identifier
//           .set(movieData);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Added to WatchList!')),
//       );
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error adding to WatchList: $error')),
//       );
//     }
//   }
//
//   void _removeFromWatchList() async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('MoviesFavorites')
//           .doc(widget.results.id.toString())
//           .delete();
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Removed from WatchList!')),
//       );
//     } catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error removing from WatchList: $error')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Icon(size: 30,
//         isFavorite ? Icons.star : Icons.star_border,
//         color: isFavorite ? AppColors.goldColor: Colors.amber,
//       ),
//       onPressed: _toggleFavorite,
//     );
//   }
// }
