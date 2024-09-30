import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/API/api_manager_homescreen.dart';
import 'package:movies/Model/TopRatedMoviesModel.dart';
import 'package:movies/Tabs/HomeTab/recommended_widget.dart';
import 'package:movies/app_colors.dart';

class RecommendedMovieCardWidget extends StatefulWidget {
  final Future<TopRatedMoviesModel?> future;
  final String headLineText;

  const RecommendedMovieCardWidget(
      {required this.future, required this.headLineText});

  @override
  State<RecommendedMovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<RecommendedMovieCardWidget> {
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
          var list = snapshot.data!.results!;


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
                          var results = list[index];

                          return RecommendedWidget(results: results);
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
