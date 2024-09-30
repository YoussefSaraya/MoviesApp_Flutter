///Movie details widget
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/API/api_manager_details.dart';
import 'package:movies/Model/movie_details_response.dart';
import 'package:movies/Model/similar_response.dart';
import 'package:movies/Tabs/Details/similar_slider.dart';
import 'package:movies/app_colors.dart';

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
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.whiteColor),
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
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.whiteColor),
              ),
              SizedBox(height: 5),
              Text(
                result.releaseDate ?? "",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.lightgreyColor),
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
                      child: SingleChildScrollView(
                        child: Text(
                          result.overview ?? "",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.whiteColor),
                          textAlign: TextAlign.start,
                        ),
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
                        Text('Something went wrong!', style: TextStyle(color: AppColors.whiteColor)),
                        ElevatedButton(onPressed: () {}, child: Text('Try Again')),
                      ],
                    );
                  } else if (snapshot.data?.success == false) {
                    return Column(
                      children: [
                        Text(snapshot.data?.status_message ?? '', style: TextStyle(color: AppColors.whiteColor)),
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
