import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../view_models/home_view_model.dart';
import '../detail/detail_view.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<HomeViewModel>(context);
    TextEditingController _searchController = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // const SizedBox(
          //   height: 30,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: modelView.isSearch
                ? TextField(
                    textInputAction: TextInputAction.search,
                    controller: _searchController,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    decoration: InputDecoration(
                      icon: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            modelView.onChangeSearchState();
                            modelView.init();
                          }),
                      hintText: "Search",
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    onEditingComplete: () {
                      modelView.search(_searchController.text);
                    },
                    onChanged: (search) {},
                  )
                : Row(
                    children: [
                      Text(
                        'Explore',
                        style: GoogleFonts.comfortaa(fontSize: 40),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                        ),
                        onPressed: () {
                          modelView.onChangeSearchState();
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.sort_by_alpha,
                        ),
                        onPressed: () {
                          if (modelView.sortFromA == true) {
                            modelView.sortNovel();
                            modelView.sortFromA = false;
                          } else {
                            modelView.sortNovel();
                            modelView.sortFromA = true;
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.refresh,
                        ),
                        onPressed: () async {
                          modelView.init();
                          await Future.delayed(const Duration(seconds: 2));
                        },
                      ),
                    ],
                  ),
          ),
          const SizedBox(
            height: 30,
          ),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                final novel = modelView.exploreNovels[i];
                return InkWell(
                  child: ListTile(
                    leading: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 64,
                        maxHeight: 64,
                      ),
                      child: Image.network(
                        novel.linkImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      novel.judul,
                    ),
                    subtitle: Text(novel.status),
                    // subtitle: Text(novel.sinopsis),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, DetailView.routeName,
                        arguments: novel.id);
                    // HomeScreen.listen = false;
                    // await Navigator.pushNamed(context, EditScreen.routeName,
                    //     arguments: i);
                    // HomeScreen.listen = true;
                  },
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Add to Library'),
                            content: const Text('Are you sure?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Fungsi Add to Library
                                  modelView.addToLibrary(
                                      modelView.exploreNovels[i].id);
                                  Navigator.pop(context);
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          );
                        });
                  },
                );
              },
              separatorBuilder: (context, i) {
                return const Divider();
              },
              itemCount: modelView.exploreNovels.length,
            ),
          ),
        ],
      ),
    );
  }
}
