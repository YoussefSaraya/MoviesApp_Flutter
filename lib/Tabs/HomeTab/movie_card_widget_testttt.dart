import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/API/api_constants.dart';
import 'package:movies/API/api_manager_homescreen.dart';
import 'package:movies/Model/NewReleasesModel.dart';
import 'package:movies/Model/PopularMoviesModel.dart';
import 'package:movies/app_colors.dart';

class MovieCardWidgetTest extends StatefulWidget {
  const MovieCardWidgetTest({super.key});

  @override
  State<MovieCardWidgetTest> createState() => _MovieCardWidgetTestState();
}

class _MovieCardWidgetTestState extends State<MovieCardWidgetTest> {
  @override
  Widget build(BuildContext context) {
    const String imageUrl = "https://image.tmdb.org/t/p/w500";

    return FutureBuilder<NewReleasesModel?>(
        future: ApiManagerHomeScreen.getNewReleasesMovie(),
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
                Text('Something went wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManagerHomeScreen.getNewReleasesMovie();
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }

          ///server=> success,error
          if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.all(10),
                            itemCount: data?.length ?? 0,
                            shrinkWrap: true,

                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(

                                    imageUrl: "$imageUrl${data?[index].posterPath}",
                                  ),
                                ),
                              );
                            }),
                      );



          } else {
            return SizedBox.shrink();
          }


        });
  }
}
