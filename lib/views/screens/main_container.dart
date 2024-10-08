import 'dart:ui';

import 'package:buuk_nuuk/utils/app_drawables.dart';
import 'package:buuk_nuuk/utils/pallete.dart';
import 'package:buuk_nuuk/utils/widget_extensions.dart';
import 'package:buuk_nuuk/views/screens/categories_screen.dart';
import 'package:buuk_nuuk/views/screens/home_screen.dart';
import 'package:buuk_nuuk/views/screens/search_screen.dart';
import 'package:buuk_nuuk/views/screens/shelf_screen.dart';
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

  final List<(String, String)> _navItems = [
    ("Home", AppIcons.icHome),
    ("Search", AppIcons.icSearch),
    ("Categories", AppIcons.icCategories),
    ("Shelf", AppIcons.icShelf),
  ];

  // final Color inActiveColor = const Color(0x0666d438);

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CategoriesScreen(),
    const ShelfScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final Color activeColor = colorScheme.secondary;
    const Color inActiveColor = Color(0xFF8B5E3C);
    // const Color inActiveColor = Colors.white;

    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xCCFAEED6),
            unselectedLabelStyle: const TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w400,
              color: inActiveColor,
            ),
            selectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: activeColor,
            ),
            selectedItemColor: activeColor,
            unselectedItemColor: inActiveColor,
            items: _navItems
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: item.$2.svgPicture(
                      color: inActiveColor,
                      height: 20,
                    ),
                    activeIcon: item.$2.svgPicture(
                      height: 20,
                      color: activeColor,
                    ),
                    label: item.$1,
                  ),
                )
                .toList(),
            onTap: _onTap,
          ),
        ),
      ),
    );
  }
}
