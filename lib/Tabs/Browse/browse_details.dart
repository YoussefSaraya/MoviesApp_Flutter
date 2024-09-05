import 'package:flutter/material.dart';
import 'package:movies/Tabs/Browse/Movies_Widget.dart';
import 'package:movies/Tabs/Browse/api/api_manager.dart';
import 'package:movies/Tabs/Browse/browse_category.dart';

import 'package:movies/app_colors.dart';
import 'package:movies/model/ResponseGenresMovies.dart';



class BrowseDetails extends StatefulWidget {
  final BrowserCategory category;

  BrowseDetails({required this.category});

  @override
  State<BrowseDetails> createState() => _BrowseDetailsState();
}

class _BrowseDetailsState extends State<BrowseDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResponseGenresMovies?>(
      future: ApiBrowseManager.getGenresMovies(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.goldColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Something went wrong',
                style: TextStyle(color: AppColors.primaryColor),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('Try again'),
              )
            ],
          );
        } else if (snapshot.data == null ||
            snapshot.data!.results == null ||
            snapshot.data!.results!.isEmpty) {
          print('No movies found for genre: ${widget.category.id}');
    return Center(
    child: Text("No movies available for this genre",
    style: Theme.of(context).textTheme.titleLarge),
    );
    }
          var genres = snapshot.data?.results ?? [];

            return Scaffold(
              backgroundColor: AppColors.primaryColor,
              appBar: AppBar(
                iconTheme: IconThemeData(color: AppColors.whiteColor, size: 30,),
                backgroundColor: Colors.black45,
                centerTitle: true,
                title: Text(
                  "${widget.category.title}",
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
              body: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 0.6),
                itemBuilder: (context, index) {
                  return MoviesWidget(results: genres[index]);
                },
                itemCount: genres.length,
              ),
            );

        }

    );
  }
}
