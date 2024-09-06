import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/API/api_manager_search.dart';
import 'package:movies/Model/MovieSearch.dart';
import 'package:movies/app_colors.dart';

class MoviesItem extends StatefulWidget {
  Movies movies;


  MoviesItem({required this.movies});

  @override
  State<MoviesItem> createState() => _MoviesItemState();
}

class _MoviesItemState extends State<MoviesItem> {
  Future<MovieSearch?>? MoviesFuture;
  List<Movies>? moviesList; // Nullable list
  static const String imageUrl = "https://image.tmdb.org/t/p/w500";



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieSearch?>(
        future: MoviesFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManagerSearch.getSearchedMovie(widget.movies.title??"");
                }, child: Text('Try again!'))
              ],
            );
          }
          if (!snapshot.hasData || snapshot.data!.results!.isEmpty) {
            return Scaffold(
              body: Center(
                child: Column(
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
                ),
              ),
            );
          }
          if(snapshot.data!.results !='ok'){
            Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManagerSearch.getSearchedMovie(widget.movies.title??"");
                }, child: Text('Try again!'))
              ],
            );

          }
          var movieslist = snapshot.data!.results!;
          return ListView.builder(itemBuilder: (context,index){

            var singleSearchedMovie= moviesList?[index];
            return Container(
              color: AppColors.primaryColor,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        /////////////////////////////////////////////////////////////

                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height*0.3,
                            fit: BoxFit.cover,
                            imageUrl: "$imageUrl${singleSearchedMovie!.posterPath}",
                            placeholder: (context, url) => Center(child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            )),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),



                        ////////////////////////////////////////////////////

                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
                          children: [
                            Text(singleSearchedMovie.title??"",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppColors.lightgreyColor,
                              ),
                              textAlign: TextAlign.start, // Align text to the start
                            ),
                            Text(
                              singleSearchedMovie.releaseDate??"",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: AppColors.lightgreyColor,
                              ),
                              textAlign: TextAlign.start, // Align text to the start
                            ),
                          ],
                        ),
                      ],
                    ),

                  ),
                  Divider(thickness: 2,color: AppColors.lightgreyColor,),


                ],
              ),
            ); // Ensure this color is defined

          },
            itemCount: moviesList!.length,


          );
        }
    );
  }
}
