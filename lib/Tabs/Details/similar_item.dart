///Similar_item
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/Model/genres_response.dart';
import 'package:movies/Model/similar_response.dart';
import 'package:movies/Tabs/Details/movie_details.dart';
import 'package:movies/app_colors.dart';

class SimilarItem extends StatelessWidget {
  SimilarResult movie;


  SimilarItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    const String imageUrl = "https://image.tmdb.org/t/p/w500";

    return
    Container(
      height: MediaQuery.of(context).size.height*0.20,
      width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          color: AppColors.itemRecommended,
          borderRadius: BorderRadius.circular(10),  // Match the border radius of the image
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),  // Same border radius as the container
                  child: CachedNetworkImage(

                    alignment: Alignment.center,
                    imageUrl: movie.posterPath != null ? "$imageUrl${movie
                        .posterPath}" : '',
                    height: MediaQuery.of(context).size.width * 0.25 * 1.0,  // Adjust height dynamically based on width
                    width: double.infinity,  // Ensure it covers full width of the container
                    fit: BoxFit.fill,
                  ),
                ),
                //
                // Image.network(
                // fit: BoxFit.fill,
                // '' + movie.posterPath!),

                Icon(
                  Icons.bookmark,
                  color: AppColors.greyColor.withOpacity(0.7),
                  size: 39,
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: 39,
                    height: 35,
                    child: Icon(
                      Icons.add,
                      color: AppColors.whiteColor,
                      size: 20,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1201,left: MediaQuery.of(context).size.width*0.01),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height*0.078,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.goldColor,
                              size: 18,
                            ),
                            Text(
                              '${movie.voteAverage}',
                              style:
                              TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),

                        Text(
                          movie.originalTitle ?? "",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          movie.releaseDate ?? "",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),],


                    ),
                  ),
                ),

              ],
            )

    ]
        ),


    );



  }
}



