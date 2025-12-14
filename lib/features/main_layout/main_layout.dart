import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/utils/app_assets.dart';
import 'package:movies/features/main_layout/explore/presentation/explore_tab.dart';
import 'package:movies/features/main_layout/home/presentation/home_tab.dart';
import 'package:movies/features/main_layout/profile/presentation/profile_tab.dart';
import 'package:movies/features/main_layout/search/presentation/search_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const ExploreTab(),
    const ProfileTab(),
  ];

  changeSelectedIndex(int selectedIndex) {
    setState(() {
      currentIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: tabs[currentIndex],
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(8),
        height: 75.h,
        color: AppColors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) => changeSelectedIndex(value),
            backgroundColor: AppColors.grey,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.yellow,
            unselectedItemColor: AppColors.white,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              CustomBottomNavBarItem(AppIcons.icHomeTab, "Home"),
              CustomBottomNavBarItem(AppIcons.icSearchTab, "Search"),
              CustomBottomNavBarItem(AppIcons.icExploreTab, "Explore"),
              CustomBottomNavBarItem(AppIcons.icProfileTab, "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;
  CustomBottomNavBarItem(this.iconPath, this.title)
    : super(
        label: title,
        icon: SvgPicture.asset(iconPath),
        activeIcon: SvgPicture.asset(iconPath, color: AppColors.yellow),
      );
}
