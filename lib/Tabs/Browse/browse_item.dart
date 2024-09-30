///Browse_Item
import 'package:flutter/material.dart';
import 'package:movies/Tabs/Browse/browse_category.dart';
import 'package:movies/app_colors.dart';



class BrowseItem extends StatelessWidget {
  BrowserCategory browserCategory;

  BrowseItem({required this.browserCategory});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Image.asset(
            browserCategory.imagePath,
            width: MediaQuery.of(context).size.width*  0.5,
            height:MediaQuery.of(context).size.height * 0.2,
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Text(browserCategory.title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 22,
                fontWeight: FontWeight.bold,

                color: AppColors.whiteColor),
          ),
        )
      ],
    );
  }
}
