import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/Model/MovieSearch.dart';
import 'package:movies/app_colors.dart';

class SearchItem extends StatelessWidget {
   SearchItem({super.key,required this.movies});

  final Future<MovieSearch?>? movies;

  @override
  Widget build(BuildContext context) {
    String imageUrl = 'https://image.tmdb.org/t/p/w500';

    return FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
                    color: AppColors.goldColor));
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }
          if (!snapshot.hasData || snapshot.data!.results!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/nomoviesfound_image.png",
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02),
                // Text("No movies found",
                // style: Theme.of(context)
                //     .textTheme
                //     .titleSmall
                //     ?.copyWith(color: AppColors.greyColor))
              ],
            );
          }
          var moviesList = snapshot.data!.results!;
          return ListView.builder(
              itemCount: moviesList.length,
              itemBuilder: (context, index) {
                var movie = moviesList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      // context,
                      // MaterialPageRoute(
                      // builder: (context) =>
                      // DetailsScreen(moviesId: movie.id)));
                    },
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: movie.posterPath != null
                                ? "$imageUrl${movie.posterPath}"
                                : '',
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.goldColor)),
                            errorWidget: (context, url, error) =>
                            const Center(
                                child: Icon(Icons.error,
                                    color: AppColors.goldColor)),
                            height: MediaQuery.of(context).size.height *
                                0.12,
                            width: MediaQuery.of(context).size.width *
                                0.40,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width:
                          MediaQuery.of(context).size.width * 0.05,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontSize: 18,color: AppColors.whiteColor),
                              ),
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height *
                                    0.02,
                              ),
                          Text(
                            movie.releaseDate != null && movie.releaseDate!.isNotEmpty
                                ? DateTime.parse(movie.releaseDate!).year.toString()
                                : 'N/A',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                fontSize: 16,
                                color: AppColors.lightgreyColor),
                          ),


                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
