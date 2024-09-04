import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/API/api_constants.dart';
import 'package:movies/Model/KeywordResponse.dart';
import 'package:movies/Model/MovieSearch.dart';


class ApiManagerSearch {
  var data=[];
  List<MovieSearch> movies=[];

  /*
https://api.themoviedb.org/3/search/movie  */

  static Future<MovieSearch?> getSearchedMovie(String query) async {
    Uri url = Uri.http(ApiConstants.baseUrl, ApiConstants.SearchedMoviesUrl,
        {
          'api_key':ApiConstants.apiKey,
          'title': query

        }
    );
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);


      ///String

      ///json
      return MovieSearch.fromJson(json);

      ///object

    } catch (e) {
      throw e;
    }
  }
}