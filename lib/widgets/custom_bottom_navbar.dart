// widgets/custom_bottom_navbar.dart
import 'package:flutter/material.dart';

import '../utils/app_pages.dart';

class CustomBottomNavBar extends StatelessWidget {
  final AppPages currentPage;
  final PageController pageController;

  const CustomBottomNavBar({
    super.key,
    required this.currentPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPage.index,
      onTap: (index) {
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 100),
          curve: Curves.fastEaseInToSlowEaseOut,
        );
      },
      iconSize: 30.0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Icon(
              currentPage == AppPages.photo
                  ? Icons.camera_alt // 채워진 아이콘
                  : Icons.camera_alt_outlined, // 외곽선 아이콘
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Icon(
              currentPage == AppPages.users
                  ? Icons.person // 채워진 아이콘
                  : Icons.person_outline, // 외곽선 아이콘
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Icon(
              currentPage == AppPages.settings
                  ? Icons.settings // 채워진 아이콘
                  : Icons.settings_outlined, // 외곽선 아이콘
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}
