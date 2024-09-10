import 'package:flutter/material.dart';
import 'package:movies/Home/home_screen.dart';
import 'package:movies/Tabs/Browse/browse_tab.dart';
import 'package:movies/Tabs/HomeTab/hometabnew.dart';
import 'package:movies/Tabs/Search/search_main_tab.dart';
void main() {
  runApp(
      MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        HomeTabNew.routeName:(context) => HomeTabNew(),
        SearchMainTab.routeName: (context) => SearchMainTab(),
        BrowseTab.routeName: (context) => BrowseTab()
      },
    );
  }
}
