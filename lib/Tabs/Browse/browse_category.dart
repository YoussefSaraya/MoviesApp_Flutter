import 'package:flutter/material.dart';

class BrowserCategory{
  String id;
  String title;
  String imagePath;


  BrowserCategory({required this.id,required this.title,required this.imagePath});

  static List<BrowserCategory> getBrowserCategories(){
    return[
      BrowserCategory(id: '28', title: 'Action',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '12', title: 'Adventure',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '16', title: 'Animation',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '35', title: 'Comedy',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '80', title: 'Crime',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '99', title: 'Documentary',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '18', title: 'Drama',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '10751', title: 'Family',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '14', title: 'Fantasy',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '36', title: 'History',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '27', title: 'Horror',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '10402', title: 'Music',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '9648', title: 'Mystery',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '10749', title: 'Romance',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '878', title: 'Science Fiction',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '10770', title: 'TV Movie',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '53', title: 'Thriller',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '10752', title: 'War',
          imagePath: 'assets/images/browse_action_img.png'),
      BrowserCategory(id: '37', title: 'Western',
          imagePath: 'assets/images/browse_action_img.png'),


    ];
  }
}
