import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/API/api_manager_homescreen.dart';
import 'package:movies/Model/PopularMoviesModel.dart';
import 'package:movies/Tabs/HomeTab/ItemSlider.dart';
import 'package:movies/Tabs/HomeTab/movie_card_widget_Popular.dart';
import 'package:movies/app_colors.dart';


class SliderMovies extends StatefulWidget {

  SliderMovies({super.key});

  @override
  State<SliderMovies> createState() => _SliderMoviesState();
}

class _SliderMoviesState extends State<SliderMovies> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularMoviesModel?>(
        future: ApiManagerHomeScreen.getPopularMovies(),
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
                      ApiManagerHomeScreen.getPopularMovies();
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }

          if (snapshot.hasData && data != null) {
            var list = snapshot.data!.results!;
            return ItemSlider(resultsList: list);
          } else {
            return SizedBox.shrink();
          }
        });
  }
}
