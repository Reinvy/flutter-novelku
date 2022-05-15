import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../view_models/auth_view_model.dart';
import '../main/explore_view.dart';
import '../main/library_view.dart';
import '../main/post_novel_view.dart';
import '../main/auth_view.dart';

class MyBottomNavBar extends StatefulWidget {
  static String routeName = '/';
  static bool listen = true;
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  final Widget _screen1 = const ExploreView();
  final Widget _screen2 = const LibraryView();
  final Widget _screen3 = const AuthView();

  late int _currentIndex;

  late PageController _pageController;

  var sortFromA = true;

  @override
  void initState() {
    _currentIndex = 0;
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _changeSelectedNavBar(int index) {
    setState(() {
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorPrimary1,
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            _screen1,
            _screen2,
            _screen3,
          ],
        ),
        floatingActionButton: _currentIndex == 2
            ? authViewModel.isAuth
                ? FloatingActionButton(
                    backgroundColor: colorPrimary4,
                    onPressed: () async {
                      await Navigator.pushNamed(
                          context, PostNovelView.routeName);
                    },
                    child: const Icon(
                      Icons.add,
                      size: 40,
                    ),
                  )
                : null
            : null,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: colorPrimary2,
          items: const [
            BottomNavigationBarItem(
              label: 'Explore',
              icon: Icon(Icons.explore),
            ),
            BottomNavigationBarItem(
              label: 'Library',
              icon: Icon(Icons.library_books_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Publish',
              icon: Icon(Icons.create),
            ),
          ],
          currentIndex: _currentIndex,
          // selectedItemColor: Colors.red,
          onTap: (index) {
            _changeSelectedNavBar(index);
          },
        ),
      ),
    );
  }
}
