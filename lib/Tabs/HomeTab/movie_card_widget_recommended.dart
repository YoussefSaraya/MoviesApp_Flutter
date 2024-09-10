import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/API/api_manager_homescreen.dart';
import 'package:movies/Model/TopRatedMoviesModel.dart';
import 'package:movies/app_colors.dart';

class MovieCardWidgetRecommended extends StatefulWidget {
  final Future<TopRatedMoviesModel?> future;
  final String headLineText;

  const MovieCardWidgetRecommended(
      {required this.future, required this.headLineText});

  @override
  State<MovieCardWidgetRecommended> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidgetRecommended> {
  @override
  Widget build(BuildContext context) {
    const String imageUrl = "https://image.tmdb.org/t/p/w500";

    return FutureBuilder<TopRatedMoviesModel?>(
        future: ApiManagerHomeScreen.getTopRatedMovies(),
        builder: (context, snapshot) {
          var data = snapshot.data?.results;

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text(
                  'Something went wrong',
                  style: TextStyle(color: AppColors.whiteColor),
                ),
                ElevatedButton(
                    onPressed: () {
                      ApiManagerHomeScreen.getTopRatedMovies();
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }

          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                color: AppColors.darkgreyColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.005,
                        left: MediaQuery.of(context).size.width * 0.02,
                      ),
                      child: Text(
                        widget.headLineText,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 20, color: AppColors.whiteColor,fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        itemCount: data?.length ?? 0,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              decoration: BoxDecoration(
                                color: AppColors.itemRecommended,
                                borderRadius: BorderRadius.circular(10),  // Match the border radius of the image
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),  // Same border radius as the container
                                    child: CachedNetworkImage(
                                      alignment: Alignment.center,
                                      imageUrl: "$imageUrl${data?[index].posterPath}",
                                      height: MediaQuery.of(context).size.width * 0.25 * 1.2,  // Adjust height dynamically based on width
                                      width: double.infinity,  // Ensure it covers full width of the container
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: AppColors.goldColor),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.001,),
                                      Text(
                                        textAlign: TextAlign.start,
                                        "${data?[index].voteAverage?.toStringAsFixed(1) ?? "N/A"}",
                                        style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(

                                    textAlign: TextAlign.start,
                                    data?[index].title ?? "Unknown",
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    textAlign: TextAlign.start,
                                    // Extract the year part from the release date, or display "N/A" if it's null
                                    data?[index].releaseDate != null
                                        ? "${DateTime.parse(data?[index].releaseDate ?? "").year}"
                                        : "N/A",
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                ],
                              ),
                            ),


                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        });
  }
}
