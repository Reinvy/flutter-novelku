import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:novelku/view_models/publish_view_model.dart';
import 'package:novelku/views/chapter/chapter_view.dart';
import 'package:novelku/view_models/home_view_model.dart';
import 'package:novelku/views/post_chapter/post_chapter_view.dart';
import 'package:provider/provider.dart';

class PublishDetailView extends StatelessWidget {
  static String routeName = '/publish_detail';
  const PublishDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<HomeViewModel>(context);
    final publishViewModel = Provider.of<PublishViewModel>(context);

    String keyNovel = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as String;
    int idNovel =
        modelView.novels.indexWhere((element) => element.id == keyNovel);
    var chapter = modelView.novels[idNovel].chapter;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: NetworkImage(modelView.novels[idNovel].linkImage),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          modelView.novels[idNovel].linkImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            modelView.novels[idNovel].judul,
                            style: GoogleFonts.roboto(fontSize: 25),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            modelView.novels[idNovel].author,
                            style: GoogleFonts.roboto(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              modelView.novels[idNovel].status == 'Berlanjut'
                                  ? const Icon(Icons.schedule_rounded, size: 17)
                                  : const Icon(Icons.check, size: 17),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                modelView.novels[idNovel].status,
                                style: GoogleFonts.roboto(fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.grey.withOpacity(0.3),
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Text(
                  modelView.novels[idNovel].sinopsis,
                  style: GoogleFonts.roboto(fontSize: 15),
                ),
                // ),
              ),
              ListTile(
                title: const Text(
                  'Chapter',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.sort_by_alpha),
                  onPressed: () {
                    modelView.sortChapter(idNovel);
                  },
                ),
              ),
              Flexible(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: chapter.length,
                    itemBuilder: (ctx, i) {
                      return InkWell(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Delete Chapter'),
                                content: const Text('Are you sure?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      publishViewModel.deleteChapter(
                                          keyNovel, chapter[i].id);
                                      Navigator.pop(context);
                                      await Future.delayed(
                                        const Duration(
                                          milliseconds: 500,
                                        ),
                                      );
                                      modelView.init();
                                    },
                                    child: const Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ChapterView.routeName,
                            arguments: {
                              'idNovel': idNovel,
                              'idChapter': chapter[i].id,
                            },
                          );
                        },
                        child: ListTile(
                          title: Text(chapter[i].judulChapter),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, PostChapterView.routeName,
                arguments: modelView.novels[idNovel].id);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
