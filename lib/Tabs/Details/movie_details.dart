///MOVIES_DETAILS
import 'package:flutter/material.dart';
import 'package:movies/API/api_manager_details.dart';
import 'package:movies/Model/movie_details_response.dart';
import 'package:movies/Model/movie_details_response.dart';
import 'package:movies/Tabs/Details/movie_details_widget.dart';
import 'package:movies/app_colors.dart';

class MoviesDetailsScreen extends StatefulWidget {
  static const String routeName = 'movie_details';
  //
  final int? movieId;

  MoviesDetailsScreen({required this.movieId});
  @override
  State<MoviesDetailsScreen> createState() => _MoviesDetailsScreenState();
}

class _MoviesDetailsScreenState extends State<MoviesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // final movieId = ModalRoute.of(context)?.settings.arguments as int?;
    if (widget.movieId == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Movie Details'),
        ),
        body: Center(
          child: Text('No movie selected'),
        ),
      );
    }

    return Scaffold(
      body: FutureBuilder<MovieDetailsResponse?>(
        future: DetailsApiManager.getDetails(widget.movieId.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.goldColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Something went wrong!'),
                  ElevatedButton(
                    onPressed: () {
                      DetailsApiManager.getDetails(widget.movieId.toString());
                    },
                    child: Text('Try Again'),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data?.success == false) {
            return Center(
              child: Text(snapshot.data?.status_message ?? 'No details available'),
            );
          }

          final movieDetails = snapshot.data!;
          return MoviesDetailsWidget(result: movieDetails);
        },
      ),
    );
  }
}
