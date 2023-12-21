import 'package:flutter/material.dart';
import 'package:pwd_mng/pages/favorite/favorite.dart';
import 'package:pwd_mng/pages/home/homepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  var widgetController = PageController();
  var widgetList = <Widget>[
    const Homepage(),
    const FavoriteHome(),
    Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text('Page 3'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        onDestinationSelected: (int index) {
          setState(() {
            widgetController.jumpToPage(index);
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.star),
            icon: Icon(Icons.star_border_outlined),
            label: 'Favorite',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            widgetController.jumpToPage(index);
            currentPageIndex = index;
          });
        },
        controller: widgetController,
        children: widgetList,
      ),
    );
  }
}
