import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/Tabs/Details/details_api_constants.dart';
import 'package:movies/model/SimilarResponse.dart';
import 'package:movies/model/TopRatedResponse.dart';
import 'package:movies/model/movieDetailsResponse.dart';
import 'package:movies/model/newReleaseResponse.dart';
import 'package:movies/model/popularResponse.dart';

class DetailsApiManager {
  static Future<PopularResponse?> getPopular() async {
    Uri url = Uri.https(DetailsApiCostants.baseUrl, DetailsApiCostants.popularApi, {
      'api_key' : 'bbbf50b28b32a9dcbfe04a0e8de215d0',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return PopularResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewReleaseResponse?> getNewRelease() async {
    Uri url = Uri.https(DetailsApiCostants.baseUrl, DetailsApiCostants.newReleaseApi, {
      'api_key' : 'bbbf50b28b32a9dcbfe04a0e8de215d0',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewReleaseResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<TopRatedResponse?> getRecommendedMov() async {
    Uri url = Uri.https(DetailsApiCostants.baseUrl, DetailsApiCostants.recommendedApi, {
      'api_key' : 'bbbf50b28b32a9dcbfe04a0e8de215d0',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return TopRatedResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<MovieDetailsResponse?> getDetails(String movieId) async {
    Uri url = Uri.https(
        DetailsApiCostants.baseUrl,
        DetailsApiCostants.detailsApi + movieId, {
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
        DetailsApiCostants.baseUrl,
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
