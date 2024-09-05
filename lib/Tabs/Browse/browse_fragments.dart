import 'package:flutter/material.dart';
import 'package:movies/Tabs/Browse/browse_category.dart';
import 'package:movies/Tabs/Browse/browse_details.dart';
import 'package:movies/Tabs/Browse/browse_item.dart';


class BrowseFragments extends StatelessWidget {
  Function onGenresItemClicked;
  BrowseFragments({required this.onGenresItemClicked});
  var BrowseList = BrowserCategory.getBrowserCategories();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing:10 ),

              itemBuilder: (context,index){
                return  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BrowseDetails(category: BrowseList[index]),
                          ));
                    },
                    child: BrowseItem(
                        browserCategory: BrowseList[index]));
              },
              itemCount: BrowseList.length,
            ),
          )
        ],
      ),

    );
  }
}