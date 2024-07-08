import 'package:buuk_nuuk/utils/app_drawables.dart';
import 'package:buuk_nuuk/utils/widget_extensions.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.black,
          child: Row(
            children: [
              SvgNavBarItem(
                icon: AppIcons.icHome,
                isSelected: pageIndex == 0,
                onTap: () => onTap(0),
              ),
              SvgNavBarItem(
                icon: AppIcons.icFavorite,
                isSelected: pageIndex == 1,
                onTap: () => onTap(1),
              ),
              SvgNavBarItem(
                icon: AppIcons.icStore,
                isSelected: pageIndex == 2,
                onTap: () => onTap(2),
              ),
              SvgNavBarItem(
                icon: AppIcons.icSettings,
                isSelected: pageIndex == 3,
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SvgNavBarItem extends StatelessWidget {
  const SvgNavBarItem({
    super.key,
    required this.icon,
    required this.isSelected,
    this.onTap,
  });
  final String icon;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 20,
          child: icon.svgPicture(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}

class NavModel {
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  NavModel({
    required this.page,
    required this.navKey,
  });
}
