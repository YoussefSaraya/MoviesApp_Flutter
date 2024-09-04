/// page : 1
/// results : []
/// total_pages : 1
/// total_results : 0

class KeywordResponse {
  KeywordResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  KeywordResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Keyword.fromJson(v));  // Replace 'Keyword' with your actual class type
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  int? page;
  List<Keyword>? results;  // Replace 'Keyword' with your actual class type
  int? totalPages;
  int? totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}

class Keyword {
  // Define properties of the Keyword class here
  // For example:
  String? id;
  String? name;

  Keyword({this.id, this.name});

  Keyword.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
