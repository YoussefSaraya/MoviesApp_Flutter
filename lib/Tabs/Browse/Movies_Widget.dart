
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../../model/ResponseGenresMovies.dart';


class MoviesWidget extends StatelessWidget {
  final MoviesResults results;

  const MoviesWidget({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://image.tmdb.org/t/p/w500';
    return Column(
      children: [
        Stack(
          children: [
            /// Image
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (context) => DetailsScreen(moviesId: results.id),));
                  },
                  child: CachedNetworkImage(
                      imageUrl: results.posterPath != null
                        ? "$baseUrl${results.posterPath}"
                        : '',
                    placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width* 0.45
                  ),
                )),
    
            // Padding(
            //     padding: const EdgeInsets.only(top: 5, left: 3),
            //     child: FavoriteFunc(results: results))
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 13,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        results.voteAverage?.toStringAsFixed(1) ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    results.title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    results.releaseDate ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 15, color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}