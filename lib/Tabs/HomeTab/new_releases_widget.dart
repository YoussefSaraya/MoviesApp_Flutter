import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/Model/NewReleasesModel.dart';
import 'package:movies/Tabs/Details/movie_details.dart';

class NewReleasesWidget extends StatelessWidget {
  final Results results;
  const NewReleasesWidget({super.key,required this.results});

  @override
  Widget build(BuildContext context) {
    const String imageUrl = "https://image.tmdb.org/t/p/w500";

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MoviesDetailsScreen(movieId: results.id)));
          },
          child: CachedNetworkImage(

            imageUrl: "$imageUrl${results.posterPath}",
          ),
        ),
      ),
    );
  }
}
