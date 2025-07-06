import 'package:flutter/material.dart';
import 'package:gachi_ganjik/screens/photos/photo_album_list_screen.dart';
import 'package:gachi_ganjik/screens/settings/settings_screen.dart';
import 'package:gachi_ganjik/screens/users/users_screen.dart';
import 'package:gachi_ganjik/widgets/custom_bottom_navbar.dart';

import '../../utils/app_pages.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  AppPages _currentPage = AppPages.photo;

  final List<Widget> _pages = [
    const PhotoAlbumListScreen(),
    const UsersScreen(),
    const SettingsScreen(),
  ];

  @override
  dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = AppPages.values[index];
            });
          },
          children: _pages,
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentPage: _currentPage,
          pageController: _pageController,
        ));
  }
}
