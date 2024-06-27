import 'package:buuk_nuuk/views/screens/categories_screen.dart';
import 'package:buuk_nuuk/views/screens/favorite_screen.dart';
import 'package:buuk_nuuk/views/screens/home_screen.dart';
import 'package:buuk_nuuk/views/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CategoriesScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color(0xFF838383),
          ),
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // icon: AppIcons.icHome.svgPicture(height: 20),
              // activeIcon: AppIcons.icHomeFilled.svgPicture(height: 20),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              // icon: AppIcons.icFavorite.svgPicture(height: 20),
              // activeIcon: AppIcons.icHistoryFilled.svgPicture(height: 20),
              label: "Favourite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              // icon: AppIcons.icStore.svgPicture(height: 20),
              // activeIcon: AppIcons.icStoreFilled.svgPicture(height: 20),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              // icon: AppIcons.icSettings.svgPicture(height: 20),
              // activeIcon: AppIcons.icSettingsFilled.svgPicture(height: 20),
              label: "Settings",
            ),
          ],
          onTap: _onTap,
        ),
      ),
    );
  }
}
