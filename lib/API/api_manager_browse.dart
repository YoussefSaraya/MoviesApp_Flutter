import 'dart:convert';
import 'package:movies/API/api_constants.dart';
import 'package:movies/Model/genres_response.dart';

import 'package:http/http.dart' as http;
class ApiBrowseManager {


  // static Future<ResponseBrowse> getGenres(String genres_id) async {
  //   Uri url = Uri.https(
  //       ApiBrowseConstants.baseUrl, ApiBrowseConstants.sourceApi,
  //       {'api_key': ApiBrowseConstants.apiKey,'id': genres_id});
  //   try {
  //     var response = await http.get(url);
  //     return ResponseBrowse.fromJson(jsonDecode(response.body));
  //   }
  //   catch (e) {
  //     throw e;
  //   }
  // }

  static Future<ResponseGenresMovies> getGenresMovies(String genresId) async {
    Uri url = Uri.https(
        ApiConstants.baseUrl, ApiConstants.genresmoviesapi,
        {'api_key': ApiConstants.apiKey,'with_genres': genresId});
    try {
      var response = await http.get(url);
      print('getGenresMovies --${response.body}');
      return ResponseGenresMovies.fromJson(jsonDecode(response.body));
    }
    catch (e) {
      throw e;
    }
  }
}
