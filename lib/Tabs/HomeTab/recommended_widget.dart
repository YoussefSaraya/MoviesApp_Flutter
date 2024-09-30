import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/Tabs/Details/movie_details.dart';
import 'package:movies/app_colors.dart';

import '../../Model/TopRatedMoviesModel.dart';

class RecommendedWidget extends StatelessWidget {
  final Results results;
  const RecommendedWidget({super.key,required this.results});


  @override
  Widget build(BuildContext context) {
    const String imageUrl = "https://image.tmdb.org/t/p/w500";

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MoviesDetailsScreen(movieId: results.id)));
          },
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
                  imageUrl: "$imageUrl${results.posterPath}",
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
                    "${results.voteAverage?.toStringAsFixed(1) ?? "N/A"}",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Text(

                textAlign: TextAlign.start,
                results.title ?? "Unknown",
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
                results.releaseDate != null
                    ? "${DateTime.parse(results.releaseDate ?? "").year}"
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
      ),


    );
  }
}
