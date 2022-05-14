import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:novelku/views/chapter/chapter_view.dart';
import 'package:novelku/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class DetailView extends StatelessWidget {
  static String routeName = '/detail';
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<HomeViewModel>(context);

    String arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as String;
    int id = modelView.novels.indexWhere((element) => element.id == arguments);

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
                    image: NetworkImage(modelView.novels[id].linkImage),
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
                          modelView.novels[id].linkImage,
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
                            modelView.novels[id].judul,
                            style: GoogleFonts.roboto(fontSize: 25),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            modelView.novels[id].author,
                            style: GoogleFonts.roboto(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              modelView.novels[id].status == 'Berlanjut'
                                  ? const Icon(Icons.schedule_rounded, size: 17)
                                  : const Icon(Icons.check, size: 17),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                modelView.novels[id].status,
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
                  modelView.novels[id].sinopsis,
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
                  icon: const Icon(
                    Icons.sort_by_alpha,
                  ),
                  onPressed: () {
                    if (modelView.sortFromA == true) {
                      modelView.sortChapter(id);
                      modelView.sortFromA = false;
                    } else {
                      modelView.sortChapter(id);
                      modelView.sortFromA = true;
                    }
                  },
                ),
              ),
              modelView.novels[id].chapter.isEmpty
                  ? Container(
                      margin: const EdgeInsets.only(top: 150),
                      child: const Text(
                        'Chapter belum tersedia',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Flexible(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: modelView.novels[id].chapter.length,
                          itemBuilder: (ctx, i) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  ChapterView.routeName,
                                  arguments: {
                                    'idNovel': id,
                                    'idChapter':
                                        modelView.novels[id].chapter[i].id,
                                  },
                                );
                              },
                              child: ListTile(
                                title: Text(modelView
                                    .novels[id].chapter[i].judulChapter),
                              ),
                            );
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
