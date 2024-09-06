import 'dart:convert';
import 'package:movies/Tabs/Browse/api/api_constants.dart';
import 'package:movies/model/ResponseBrowse.dart';
import 'package:movies/model/ResponseGenresMovies.dart';
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
        ApiBrowseConstants.baseUrl, ApiBrowseConstants.genresmoviesapi,
        {'api_key': ApiBrowseConstants.apiKey,'with_genres': genresId});
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
