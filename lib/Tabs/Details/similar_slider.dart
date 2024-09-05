import 'package:flutter/material.dart';
import 'package:movies/Tabs/Details/similar_item.dart';
import 'package:movies/model/SimilarResponse.dart';



class SimilarSlider extends StatelessWidget {
  List<SimilarResult> similarResult;

  SimilarSlider({required this.similarResult});

  @override
  Widget build(BuildContext context) {
    print(similarResult.length);
    return Container(
      height: MediaQuery.of(context).size.height * 0.26,
      color: Colors.black,
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('More like this', style: TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 15,
                );
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SimilarItem(movie: similarResult[index]);
              },
              itemCount: similarResult.length,
            ),
          )
        ],
      ),
    );
  }
}