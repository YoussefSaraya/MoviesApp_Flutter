///movie details response



/// adult : false
/// backdrop_path : "/xJHokMbljvjADYdit5fK5VQsXEG.jpg"
/// belongs_to_collection : null
/// budget : 165000000
/// genres : [{"id":12,"name":"Adventure"},{"id":18,"name":"Drama"},{"id":878,"name":"Science Fiction"}]
/// homepage : "http://www.interstellarmovie.net/"
/// id : 157336
/// imdb_id : "tt0816692"
/// original_language : "en"
/// original_title : "Interstellar"
/// overview : "The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage."
/// popularity : 145.941
/// poster_path : "/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg"
/// production_companies : [{"id":923,"logo_path":"/5UQsZrfbfG2dYJbx8DxfoTr2Bvu.png","name":"Legendary Pictures","origin_country":"US"},{"id":9996,"logo_path":"/3tvBqYsBhxWeHlu62SIJ1el93O7.png","name":"Syncopy","origin_country":"GB"},{"id":13769,"logo_path":null,"name":"Lynda Obst Productions","origin_country":""}]
/// production_countries : [{"iso_3166_1":"GB","name":"United Kingdom"},{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "2014-11-05"
/// revenue : 701729206
/// runtime : 169
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"}]
/// status : "Released"
/// tagline : "Mankind was born on Earth. It was never meant to die here."
/// title : "Interstellar"
/// video : false
/// vote_average : 8.4
/// vote_count : 33050
/// videos : {"results":[{"iso_639_1":"en","iso_3166_1":"US","name":"INTERSTELLAR - Own it TODAY on Blu-ray and DIGITAL HD!","key":"KlyknsTJk0w","published_at":"2015-03-20T21:10:51.000Z","site":"YouTube","size":1080,"type":"Teaser","official":true,"id":"57817ab4c3a36813870024b7"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar – Building A Black Hole – Official Warner Bros.","key":"MfGfZwQ_qaY","site":"YouTube","size":1080,"type":"Featurette","official":true,"published_at":"2014-10-24T12:59:28.000Z","id":"5db465f6f056d500180e96ff"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar Movie - Official Trailer 3","key":"0vxOhd4qlnA","published_at":"2014-10-01T21:37:54.000Z","site":"YouTube","size":1080,"type":"Trailer","official":false,"id":"57817accc3a368592500392e"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar – Trailer 4 – Official Warner Bros.","key":"LY19rHKAaAg","published_at":"2014-10-01T19:00:20.000Z","site":"YouTube","size":1080,"type":"Trailer","official":true,"id":"57817b0fc3a368592500394d"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar Movie - Official Trailer 2","key":"Rt2LHkSwdPQ","published_at":"2014-07-31T23:00:58.000Z","site":"YouTube","size":1080,"type":"Trailer","official":false,"id":"5795006f92514142390035ae"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar – Trailer 3 – Official Warner Bros.","key":"ePbKGoIGAXY","published_at":"2014-07-31T23:00:27.000Z","site":"YouTube","size":1080,"type":"Trailer","official":true,"id":"5add84850e0a2608d8009256"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar Movie - Official Trailer","key":"2LqzF5WauAw","published_at":"2014-05-16T17:56:42.000Z","site":"YouTube","size":1080,"type":"Trailer","official":false,"id":"5794fffbc3a36829ab00056f"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar - Trailer - Official Warner Bros. UK","key":"zSWdZVtXT7E","published_at":"2014-05-16T17:00:22.000Z","site":"YouTube","size":1080,"type":"Trailer","official":true,"id":"57817aa69251417bfc000a58"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar Movie - Official Teaser","key":"nyc6RJEEe0U","published_at":"2013-12-14T16:07:52.000Z","site":"YouTube","size":1080,"type":"Trailer","official":false,"id":"57817a91c3a36873ea000adf"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar - Teaser Trailer - Official Warner Bros. UK","key":"827FNDpQWrQ","published_at":"2013-12-14T16:00:10.000Z","site":"YouTube","size":1080,"type":"Trailer","official":true,"id":"57817ada9251417c28000b02"}]}
class MovieDetailsResponse {
  MovieDetailsResponse({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.videos,
    this.status_code,
    this.status_message,
    this.success
  });

  MovieDetailsResponse.fromJson(dynamic json) {
    status_code = json['status_code'];
    status_message = json['status_message'];
    success = json['success'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    videos = json['videos'] != null ? Videos.fromJson(json['videos']) : null;
  }
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  Videos? videos;
  String? status_message;
  int? status_code;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['belongs_to_collection'] = belongsToCollection;
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] = productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] = productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] = spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    if (videos != null) {
      map['videos'] = videos?.toJson();
    }
    return map;
  }

}

/// results : [{"iso_639_1":"en","iso_3166_1":"US","name":"INTERSTELLAR - Own it TODAY on Blu-ray and DIGITAL HD!","key":"KlyknsTJk0w","published_at":"2015-03-20T21:10:51.000Z","site":"YouTube","size":1080,"type":"Teaser","official":true,"id":"57817ab4c3a36813870024b7"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar – Building A Black Hole – Official Warner Bros.","key":"MfGfZwQ_qaY","site":"YouTube","size":1080,"type":"Featurette","official":true,"published_at":"2014-10-24T12:59:28.000Z","id":"5db465f6f056d500180e96ff"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar Movie - Official Trailer 3","key":"0vxOhd4qlnA","published_at":"2014-10-01T21:37:54.000Z","site":"YouTube","size":1080,"type":"Trailer","official":false,"id":"57817accc3a368592500392e"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar – Trailer 4 – Official Warner Bros.","key":"LY19rHKAaAg","published_at":"2014-10-01T19:00:20.000Z","site":"YouTube","size":1080,"type":"Trailer","official":true,"id":"57817b0fc3a368592500394d"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar Movie - Official Trailer 2","key":"Rt2LHkSwdPQ","published_at":"2014-07-31T23:00:58.000Z","site":"YouTube","size":1080,"type":"Trailer","official":false,"id":"5795006f92514142390035ae"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar – Trailer 3 – Official Warner Bros.","key":"ePbKGoIGAXY","published_at":"2014-07-31T23:00:27.000Z","site":"YouTube","size":1080,"type":"Trailer","official":true,"id":"5add84850e0a2608d8009256"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar Movie - Official Trailer","key":"2LqzF5WauAw","published_at":"2014-05-16T17:56:42.000Z","site":"YouTube","size":1080,"type":"Trailer","official":false,"id":"5794fffbc3a36829ab00056f"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar - Trailer - Official Warner Bros. UK","key":"zSWdZVtXT7E","published_at":"2014-05-16T17:00:22.000Z","site":"YouTube","size":1080,"type":"Trailer","official":true,"id":"57817aa69251417bfc000a58"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar Movie - Official Teaser","key":"nyc6RJEEe0U","published_at":"2013-12-14T16:07:52.000Z","site":"YouTube","size":1080,"type":"Trailer","official":false,"id":"57817a91c3a36873ea000adf"},{"iso_639_1":"en","iso_3166_1":"US","name":"Interstellar - Teaser Trailer - Official Warner Bros. UK","key":"827FNDpQWrQ","published_at":"2013-12-14T16:00:10.000Z","site":"YouTube","size":1080,"type":"Trailer","official":true,"id":"57817ada9251417c28000b02"}]

class Videos {
  Videos({
    this.results,});

  Videos.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(MovieDetailsResult.fromJson(v));
      });
    }
  }
  List<MovieDetailsResult>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// iso_639_1 : "en"
/// iso_3166_1 : "US"
/// name : "INTERSTELLAR - Own it TODAY on Blu-ray and DIGITAL HD!"
/// key : "KlyknsTJk0w"
/// published_at : "2015-03-20T21:10:51.000Z"
/// site : "YouTube"
/// size : 1080
/// type : "Teaser"
/// official : true
/// id : "57817ab4c3a36813870024b7"
class MovieDetailsResult {
  MovieDetailsResult({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.publishedAt,
    this.site,
    this.size,
    this.type,
    this.official,
    this.id,});

  MovieDetailsResult.fromJson(dynamic json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    publishedAt = json['published_at'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    id = json['id'];
  }
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? publishedAt;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_639_1'] = iso6391;
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    map['key'] = key;
    map['published_at'] = publishedAt;
    map['site'] = site;
    map['size'] = size;
    map['type'] = type;
    map['official'] = official;
    map['id'] = id;
    return map;
  }

}

/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"
class SpokenLanguages {
  SpokenLanguages({
    this.englishName,
    this.iso6391,
    this.name,});

  SpokenLanguages.fromJson(dynamic json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }
  String? englishName;
  String? iso6391;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = englishName;
    map['iso_639_1'] = iso6391;
    map['name'] = name;
    return map;
  }

}

/// iso_3166_1 : "GB"
/// name : "United Kingdom"
class ProductionCountries {
  ProductionCountries({
    this.iso31661,
    this.name,});

  ProductionCountries.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }
  String? iso31661;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    return map;
  }

}

/// id : 923
/// logo_path : "/5UQsZrfbfG2dYJbx8DxfoTr2Bvu.png"
/// name : "Legendary Pictures"
/// origin_country : "US"
class ProductionCompanies {
  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,});

  ProductionCompanies.fromJson(dynamic json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo_path'] = logoPath;
    map['name'] = name;
    map['origin_country'] = originCountry;
    return map;
  }

}

/// id : 12
/// name : "Adventure"
class Genres {
  Genres({
    this.id,
    this.name,});

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}