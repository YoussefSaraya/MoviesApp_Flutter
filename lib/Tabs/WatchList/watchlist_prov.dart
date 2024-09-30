// ///watchlist prov
// import 'package:flutter/material.dart';
// import 'package:movies/Model/movies_response.dart';
// import 'package:movies/Model/movies_response.dart';
// import 'firebase_firestore.dart';
//
//
// class WatchListProvider extends ChangeNotifier {
//   final FireStoreFireBase _FireStoreFireBase = FireStoreFireBase();
//   List<Movie> movies = [];
//   Future<void> fetchWatchList() async {
//     try {
//       movies = await _FireStoreFireBase.fetchFavorites();
//       notifyListeners();
//     } catch (error) {
//       print('Error: $error');
//     }
//   }
//   void addToWatchList(Movie movie) async {
//     try {
//       await _FireStoreFireBase.addFavorite(movie);
//       if (!movies.contains(movie)) {
//         movies.add(movie);
//         notifyListeners();
//       }
//     } catch (error) {
//       print("$error");
//     }
//   }
//
//   void removeFromWatchList(Movie movie) async {
//     try {
//       await _FireStoreFireBase.removeFromFavorites(movie.id.toString());
//       movies.remove(movie);
//       notifyListeners();
//     } catch (error) {
//       print('$error');
//     }
//   }
// }
