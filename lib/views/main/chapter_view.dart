import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../view_models/chapter_view_model.dart';
import '../../view_models/novel_view_model.dart';

class ChapterView extends StatelessWidget {
  static String routeName = '/chapter';
  const ChapterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final novelProvider = Provider.of<NovelViewModel>(context);
    final modelView = Provider.of<ChapterViewModel>(context);

    var arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    int idNovel = arguments['idNovel'];
    int idChapter = novelProvider.novels[idNovel].chapter
        .indexWhere((element) => element.id == arguments['idChapter']);

    final chapter = novelProvider.novels[idNovel].chapter[idChapter];

    return SafeArea(
      child: Scaffold(
        appBar: Tab(
          height: chapter.judulChapter.length.toDouble() > 30 ? 60 : 40,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.center,
            color: modelView.darkTheme == false
                ? colorPrimary2
                : Colors.black.withOpacity(0.8),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    chapter.judulChapter,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: modelView.darkTheme == false
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
                const SizedBox()
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              color: modelView.darkTheme == false
                  ? colorPrimary1
                  : Colors.black.withOpacity(0.9),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      chapter.content,
                      style: GoogleFonts.roboto(
                        // fontWeight: FontWeight.w400,
                        fontSize: modelView.fontSize,
                        color: modelView.darkTheme == false
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          height: 50,
          color: modelView.darkTheme == false
              ? colorPrimary2
              : Colors.black.withOpacity(0.8),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    splashRadius: 15,
                    onPressed: modelView.fontSize <= 15
                        ? null
                        : () {
                            modelView.decrement();
                          },
                    icon: Icon(
                      Icons.remove,
                      color: modelView.darkTheme == false
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  Text(
                    '${modelView.fontSize.toInt()}',
                    style: TextStyle(
                      color: modelView.darkTheme == false
                          ? Colors.black
                          : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    splashRadius: 15,
                    onPressed: modelView.fontSize >= 30
                        ? null
                        : () {
                            modelView.increment();
                          },
                    icon: Icon(
                      Icons.add,
                      color: modelView.darkTheme == false
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 10,
                child: IconButton(
                  splashRadius: 15,
                  onPressed: () {
                    modelView.changeTheme();
                  },
                  icon: modelView.darkTheme == false
                      ? const Icon(
                          Icons.dark_mode,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.light_mode,
                          color: Colors.yellow,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
