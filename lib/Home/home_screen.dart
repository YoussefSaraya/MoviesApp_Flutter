import 'package:flutter/material.dart';
import 'package:movies/Tabs/Browse/browse_tab.dart';
import 'package:movies/Tabs/HomeTab/home_tab.dart';
import 'package:movies/Tabs/Search/search_tab.dart';
import 'package:movies/Tabs/WatchList/watchlist_tab.dart';
import 'package:movies/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  // List of tabs for navigation
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchListTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: AppColors.primaryColor,),
        Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
              backgroundColor: AppColors.primaryColor,
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/home_icon.png')),
                  label: 'Home', // Add label
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/search_icon.png')),
                  label: 'Search', // Add label
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/browse_icon.png')),
                  label: 'Browse', // Add label
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/watchlist_icon.png')),
                  label: 'Watchlist', // Add label
                ),
              ],
              selectedItemColor: AppColors.goldColor,
              showUnselectedLabels: true,
              iconSize: 40,
            ),
          ),
          body: tabs[selectedIndex], // Display the selected tab content
        ),
      ],
    );
  }
}
