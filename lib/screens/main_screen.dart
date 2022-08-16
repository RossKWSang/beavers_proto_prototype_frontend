import 'package:beavers_prototype/screens/board/board_screen.dart';
import 'package:beavers_prototype/screens/home/home_screen.dart';
import 'package:beavers_prototype/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(
      () {
        _page = page;
      },
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          HomeScreen(),
          BoardScreen(),
          Center(
            child: Text(
              'My 비버',
            ),
          ),
        ],
        controller: _pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: navigationTapped,
        selectedItemColor: primaryColor, // 선택된 아이콘 색상
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: (_page == 0) ? primaryColor : secondaryColor,
            ),
            label: '비버홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.campaign_rounded,
              color: (_page == 1) ? primaryColor : secondaryColor,
            ),
            label: '비버 게시판',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.ellipsis,
              color: (_page == 2) ? primaryColor : secondaryColor,
            ),
            label: '더보기',
          ),
        ],
      ),
    );
  }
}
