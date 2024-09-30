import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/Model/movies_response.dart';

import '../../app_colors.dart';

class MovieDetails extends StatelessWidget {
  Movie movie;
  MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://image.tmdb.org/t/p/w500';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.40,
            height: MediaQuery.of(context).size.height * 0.12,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: movie.posterPath != null ?
                    '$baseUrl${movie.posterPath}':'' ,
                    placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                        )),
                  ),
                ),
                const Icon(
                  Icons.star,
                  size: 40,
                  color: AppColors.goldColor,
                ),

              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 20)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Text(
                movie.releaseDate ?? '',
                style: Theme.of(context)
                    .textTheme

                    .titleMedium!
                    .copyWith(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "Release Date",
                style: TextStyle(color: Colors.white54),
              ),


            ],
          ),
        ],
      ),
    );
  }
}
