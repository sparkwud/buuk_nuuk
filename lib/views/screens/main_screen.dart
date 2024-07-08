import 'package:buuk_nuuk/views/screens/categories_screen.dart';
import 'package:buuk_nuuk/views/screens/favorite_screen.dart';
import 'package:buuk_nuuk/views/screens/home_screen.dart';
import 'package:buuk_nuuk/views/screens/nav_bar.dart';
import 'package:buuk_nuuk/views/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];

  @override
  void initState() {
    super.initState();
    items = [
      NavModel(
        page: const HomeScreen(),
        navKey: homeNavKey,
      ),
      NavModel(
        page: const FavoriteScreen(),
        navKey: searchNavKey,
      ),
      NavModel(
        page: const CategoriesScreen(),
        navKey: notificationNavKey,
      ),
      NavModel(
        page: const SettingsScreen(),
        navKey: profileNavKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: selectedTab,
              children: items
                  .map(
                    (page) => Navigator(
                      key: page.navKey,
                      onGenerateInitialRoutes: (navigator, initialRoute) {
                        return [
                          MaterialPageRoute(
                            builder: (context) => page.page,
                          ),
                        ];
                      },
                    ),
                  )
                  .toList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: NavBar(
                pageIndex: selectedTab,
                onTap: (index) {
                  if (index == selectedTab) {
                    items[index]
                        .navKey
                        .currentState
                        ?.popUntil((route) => route.isFirst);
                  } else {
                    setState(() {
                      selectedTab = index;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
