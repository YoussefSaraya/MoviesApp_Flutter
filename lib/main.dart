import 'package:flutter/material.dart';
import 'package:movies/Home/home_screen.dart';
import 'package:movies/Tabs/Browse/browse_tab.dart';
import 'package:movies/Tabs/HomeTab/home_tab.dart';
import 'package:movies/Tabs/Search/search_tab.dart';
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
        HomeTab.routeName: (context) => HomeTab(),
        SearchTab.routeName: (context) => SearchTab(),
        BrowseTab.routeName: (context) => BrowseTab()
      },
    );
  }
}
