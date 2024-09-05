import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies/Tabs/Browse/browse_category.dart';
import 'package:movies/Tabs/Browse/browse_details.dart';
import 'package:movies/Tabs/Browse/browse_fragments.dart';
import 'package:movies/app_colors.dart';


class BrowseTab extends StatefulWidget {
  static const String routeName = 'browse_tab';

  @override
  State<BrowseTab> createState() => _BrowseTabState();

}
class _BrowseTabState extends State<BrowseTab> {
  // var categoriesList = BrowserCategory.getBrowserCategories();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title:
          Text('Browse Category',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 25,color: AppColors.whiteColor)),

        ),
        body: selectedGenres==null ?
        BrowseFragments(onGenresItemClicked: onGenresItemClicked):
        BrowseDetails(category:selectedGenres! )




    );

  }


  BrowserCategory? selectedGenres;

  void onGenresItemClicked(BrowserCategory newCategory){
    selectedGenres=newCategory;
    setState(() {

    });
  }
}
