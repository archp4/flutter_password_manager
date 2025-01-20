import 'package:flutter/material.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';
import 'package:pwd_mng/pages/favorite/favorite.dart';
import 'package:pwd_mng/pages/home/homepage.dart';
import 'package:pwd_mng/pages/settings/settings.dart';
import 'package:pwd_mng/pages/splash/auth.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  var widgetController = PageController();

  var widgetList = [
    const Homepage(),
    const FavoriteHome(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return FGBGNotifier(
      onEvent: (value) {
        if (value.index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const AuthHome(),
            ),
          );
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
