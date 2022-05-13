import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../view_models/home_view_model.dart';
import '../explore/explore_view.dart';
import '../library/library_view.dart';
import '../post_novel/post_novel_view.dart';

import '../auth/auth_view.dart';
import '../../view_models/auth_view_model.dart';

class HomeView extends StatefulWidget {
  static String routeName = '/';
  static bool listen = true;
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
      _currentIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<HomeViewModel>(context);
    final authViewModel = Provider.of<AuthViewModel>(context);
    return SafeArea(
      child: Scaffold(
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
                    onPressed: () async {
                      if (sortFromA == true) {
                        modelView.sortData(sortFromA);
                        sortFromA = false;
                      } else {
                        modelView.sortData(sortFromA);
                        sortFromA = true;
                      }
                      // PostViewModel().akses();
                      // PostNovelViewModel().uploadImage();
                      // LocalStorage.setUserData('bahrul@gmail.com', 'section125');
                      // LocalStorage.getUserData();
                      // authViewModel.logOut();
                      // modelView.postNovel();
                      // modelView.updateLibrary();
                      // modelView.getAllData();
                      // modelView.updateToken();
                      // modelView.updateLibrary();
                      // modelView.copyData('-N105m3b_YVZj_hgnBpq');
                      // HomeScreen.listen = false;
                      await Navigator.pushNamed(
                          context, PostNovelView.routeName);
                      // HomeScreen.listen = true;
                    },
                    child: const Icon(Icons.sort_by_alpha),
                  )
                : null
            : null,
        bottomNavigationBar: BottomNavigationBar(
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
