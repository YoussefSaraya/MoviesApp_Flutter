import 'package:flutter/material.dart';
import 'package:movies/API/api_manager_search.dart';
import 'package:movies/Model/MovieSearch.dart';
import 'package:movies/Tabs/Search/MoviesItem.dart';
import 'package:movies/app_colors.dart'; // Ensure this path is correct

class SearchTab extends StatefulWidget {
  static const String routeName = 'search_tab';
  final List<Movies>? moviesList; // Nullable list

  const SearchTab({super.key, this.moviesList}); // Updated constructor

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  int selectedIndex = 0;
  Future<MovieSearch?>? movies;
  TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Padding(
            padding: const EdgeInsets.all( 10.0),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: 45.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.greyColor,
                border: Border.all(
                  color: AppColors.lightgreyColor,
                  width: 0.8,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),

                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onChanged:searchForMovies ,
                      decoration: InputDecoration(
                        prefixIcon:Icon(Icons.search, color: AppColors.whiteColor),
                        fillColor: AppColors.greyColor,
                        hintText: 'Search...',
                        hintStyle: TextStyle(color: AppColors.lightgreyColor),

                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30))


                        ),
                          suffixIcon: controller.text.isNotEmpty
                              ? IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: AppColors.whiteColor,
                              ),
                              onPressed: () {
                                controller.clear();
                                setState(() {
                                });
                              })
                              : null

                      ),
                      style: TextStyle(color: AppColors.primaryColor),
                      onSubmitted: (query) => searchForMovies(query),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: widget.moviesList == null || widget.moviesList!.isEmpty
                ? Center(
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
                    )
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      // Safe null check before accessing moviesList
                      if (widget.moviesList == null ||
                          index >= widget.moviesList!.length) {
                        return SizedBox
                            .shrink(); // Return empty space if out of bounds
                      }
                      return MoviesItem(
                          movies: widget.moviesList![
                              index]); // Pass the actual movie object
                    },
                    itemCount: widget.moviesList?.length ,
                    // Safe check for null list
                    scrollDirection: Axis.vertical,
                  ),
          ),
          // Expanded(
          //   child: MoviesItem(
          //     movies: widget.moviesList![selectedIndex], // Assuming this is for detailed view
          //   ),
          // ),
        ],
      ),
    );
  }

  void searchForMovies(String query) {
    setState(() {
      movies = ApiManagerSearch.getSearchedMovie(query);
    });
  }
}
