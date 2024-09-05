import 'package:flutter/material.dart';
import 'package:movies/Tabs/Details/details_api_manager.dart';
import 'package:movies/Tabs/Details/my_theme.dart';
import 'package:movies/Tabs/Details/similar_slider.dart';
import 'package:movies/model/SimilarResponse.dart';
import 'package:movies/model/movieDetailsResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MoviesDetailsWidget extends StatelessWidget {
  final MovieDetailsResponse result;

  MoviesDetailsWidget({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          result.title ?? "",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: MyTheme.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: CachedNetworkImage(
                  imageUrl: result.backdropPath != null ? "https://image.tmdb.org/t/p/w500${result.backdropPath!}" : '',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(height: 5),
              Text(
                result.title ?? "",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.white),
              ),
              SizedBox(height: 5),
              Text(
                result.releaseDate ?? "",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: MyTheme.lightGrey),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  CachedNetworkImage(
                    height: 150,
                    imageUrl: result.posterPath != null ? "https://image.tmdb.org/t/p/w500${result.posterPath!}" : '',
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 160,
                      child: Text(
                        result.overview ?? "",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.white),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ],
              ),
              FutureBuilder<SimilarResponse?>(
                future: DetailsApiManager.getSimilar(result.id.toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text('Something went wrong!', style: TextStyle(color: Colors.white)),
                        ElevatedButton(onPressed: () {}, child: Text('Try Again')),
                      ],
                    );
                  } else if (snapshot.data?.success == false) {
                    return Column(
                      children: [
                        Text(snapshot.data?.status_message ?? '', style: TextStyle(color: Colors.white)),
                        ElevatedButton(onPressed: () {}, child: Text('Try Again')),
                      ],
                    );
                  }

                  final similarMovies = snapshot.data?.results ?? [];
                  return similarMovies.isNotEmpty
                      ? SimilarSlider(similarResult: similarMovies)
                      : SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
