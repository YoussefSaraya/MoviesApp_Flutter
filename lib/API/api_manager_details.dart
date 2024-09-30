///DEtails_api_manager:
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/API/api_constants.dart';
import 'package:movies/Model/NewReleasesModel.dart';
import 'package:movies/Model/PopularMoviesModel.dart';
import 'package:movies/Model/TopRatedMoviesModel.dart';
import 'package:movies/Model/movie_details_response.dart';
import 'package:movies/Model/similar_response.dart';


class DetailsApiManager {
  static Future<PopularMoviesModel?> getPopular() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.PopularMoviesUrl, {
      'api_key' : '978025e4f8f47c6871b8ab37fba1fa71',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return PopularMoviesModel.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewReleasesModel?> getNewRelease() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newReleasesUrl, {
      'api_key' : 'bbbf50b28b32a9dcbfe04a0e8de215d0',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewReleasesModel.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<TopRatedMoviesModel?> getRecommendedMov() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.topRatedUrl, {
      'api_key' : 'bbbf50b28b32a9dcbfe04a0e8de215d0',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return TopRatedMoviesModel.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<MovieDetailsResponse?> getDetails(String movieId) async {
    Uri url = Uri.https(
        ApiConstants.baseUrl,
        ApiConstants.detailsApi + movieId, {
      'api_key' : 'bbbf50b28b32a9dcbfe04a0e8de215d0',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MovieDetailsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<SimilarResponse?> getSimilar(String movieId) async {
    Uri url = Uri.https(
        ApiConstants.baseUrl,
        "/3/movie/$movieId/similar",{
      'api_key' : 'bbbf50b28b32a9dcbfe04a0e8de215d0',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SimilarResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
