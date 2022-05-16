import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import '../view_models/publish_view_model.dart';
import '../view_models/auth_view_model.dart';
import '../views/main/chapter_view.dart';
import '../view_models/chapter_view_model.dart';
import '../views/main/detail_view.dart';
import '../views/widgets/my_bottom_navigation_bar.dart';
import '../view_models/novel_view_model.dart';
import '../views/main/post_chapter_view.dart';
import '../views/main/post_novel_view.dart';
import '../views/main/publish_detail_view.dart';
import '../component/my_behavor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => AuthViewModel(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => NovelViewModel(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => ChapterViewModel(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => PublishViewModel(),
          ),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            scrollBehavior: MyBehavior(),
            initialRoute: MyBottomNavBar.routeName,
            onGenerateRoute: (settings) {
              if (settings.name == MyBottomNavBar.routeName) {
                return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (_, __, ___) => const MyBottomNavBar(),
                  transitionsBuilder: (context, a1, a2, child) =>
                      ScaleTransition(
                    scale: a1,
                    child: child,
                  ),
                  transitionDuration: const Duration(milliseconds: 500),
                );
              } else if (settings.name == DetailView.routeName) {
                return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (_, __, ___) => const DetailView(),
                  transitionsBuilder: (context, a1, a2, child) =>
                      ScaleTransition(
                    scale: a1,
                    child: child,
                  ),
                  transitionDuration: const Duration(milliseconds: 500),
                );
              } else if (settings.name == PublishDetailView.routeName) {
                return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (_, __, ___) => const PublishDetailView(),
                  transitionsBuilder: (context, a1, a2, child) =>
                      ScaleTransition(
                    scale: a1,
                    child: child,
                  ),
                  transitionDuration: const Duration(milliseconds: 500),
                );
              } else if (settings.name == ChapterView.routeName) {
                return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (_, __, ___) => const ChapterView(),
                  transitionsBuilder: (context, a1, a2, child) =>
                      ScaleTransition(
                    scale: a1,
                    child: child,
                  ),
                  transitionDuration: const Duration(milliseconds: 500),
                );
              } else if (settings.name == PostNovelView.routeName) {
                return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (_, __, ___) => const PostNovelView(),
                  transitionsBuilder: (context, a1, a2, child) =>
                      ScaleTransition(
                    scale: a1,
                    child: child,
                  ),
                  transitionDuration: const Duration(milliseconds: 500),
                );
              } else if (settings.name == PostChapterView.routeName) {
                return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (_, __, ___) => const PostChapterView(),
                  transitionsBuilder: (context, a1, a2, child) =>
                      ScaleTransition(
                    scale: a1,
                    child: child,
                  ),
                  transitionDuration: const Duration(milliseconds: 500),
                );
              }
            },
          );
        });
  }
}
