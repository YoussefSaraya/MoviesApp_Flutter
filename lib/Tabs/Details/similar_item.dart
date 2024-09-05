import 'package:flutter/material.dart';
import 'package:movies/Tabs/Details/my_theme.dart';
import 'package:movies/model/SimilarResponse.dart';

class SimilarItem extends StatelessWidget {
  SimilarResult movie;

  SimilarItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.borderGrey,
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              width: 120,
              height: 110,
              child: Image.network(
                  fit: BoxFit.fill,
                  '' + movie.posterPath!),
            ),
            Icon(
              Icons.bookmark,
              color: MyTheme.selectedYellow,
              size: 39,
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                width: 39,
                height: 35,
                child: Icon(
                  Icons.add,
                  color: MyTheme.white,
                  size: 20,
                ),
              ),
            ),
          ]),
          Row(
            children: [
              Icon(
                Icons.star,
                color: MyTheme.selectedYellow,
                size: 18,
              ),
              Text(
                '${movie.voteAverage}',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
          Container(
            height: 13,
            child: Text(
              movie.originalTitle ?? "",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Text(
            movie.releaseDate ?? "",
            style: TextStyle(color: Colors.white, fontSize: 12),
          )
        ],
      ),
    );

  }
}