import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/API/api_constants.dart';
import 'package:movies/Model/KeywordResponse.dart';
import 'package:movies/Model/MovieSearch.dart';
import 'package:movies/Model/NewReleasesModel.dart';
import 'package:movies/Model/PopularMoviesModel.dart';
import 'package:movies/Model/TopRatedMoviesModel.dart';


class ApiManagerHomeScreen {
  // var data=[];
  // List<NewReleasesModel> movies=[];

  /*

https://api.themoviedb.org/3/movie/upcoming  */

  static Future<NewReleasesModel?> getNewReleasesMovie() async {
    Uri url = Uri.http(ApiConstants.baseUrl, ApiConstants.newReleasesUrl,
        {
          'api_key':ApiConstants.apiKey
        }
    );
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);

      print(responseBody);


      ///String

      ///json
      return NewReleasesModel.fromJson(json);

      ///object

    } catch (e) {
      throw e;
    }
  }


  static Future<TopRatedMoviesModel?> getTopRatedMovies() async {
    Uri url = Uri.http(ApiConstants.baseUrl, ApiConstants.topRatedUrl,
        {
          'api_key':ApiConstants.apiKey
        }
    );
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);

      print(responseBody);


      ///String

      ///json
      return TopRatedMoviesModel.fromJson(json);

      ///object

    } catch (e) {
      throw e;
    }
  }


  static Future<PopularMoviesModel?> getPopularMovies() async {
    Uri url = Uri.http(ApiConstants.baseUrl, ApiConstants.PopularMoviesUrl,
        {
          'api_key':ApiConstants.apiKey
        }
    );
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);

      print(responseBody);


      ///String

      ///json
      return PopularMoviesModel.fromJson(json);

      ///object

    } catch (e) {
      throw e;
    }
  }

}