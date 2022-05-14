import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:novelku/view_models/publish_view_model.dart';
import 'package:novelku/view_models/auth_view_model.dart';
import 'package:novelku/views/chapter/chapter_view.dart';
import 'package:novelku/view_models/chapter_view_model.dart';
import 'package:novelku/views/detail/detail_view.dart';
import 'package:novelku/views/home/home_view.dart';
import 'package:novelku/view_models/home_view_model.dart';
import 'package:novelku/views/auth/auth_view.dart';
import 'package:novelku/views/post_chapter/post_chapter_view.dart';
import 'package:novelku/views/post_novel/post_novel_view.dart';
import 'package:novelku/views/publish_detail/publish_detail_view.dart';
import 'package:novelku/widgets/my_behavor.dart';
import 'package:provider/provider.dart';

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
            create: (ctx) => HomeViewModel(),
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
            initialRoute: HomeView.routeName,
            routes: {
              AuthView.routeName: (context) => const AuthView(),
              HomeView.routeName: (context) => const HomeView(),
              DetailView.routeName: (context) => const DetailView(),
              PublishDetailView.routeName: (context) =>
                  const PublishDetailView(),
              ChapterView.routeName: (context) => const ChapterView(),
              PostNovelView.routeName: (context) => const PostNovelView(),
              PostChapterView.routeName: (context) => const PostChapterView(),
            },
          );
        });
  }
}
