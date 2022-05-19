import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/auth_view_model.dart';
import '../../view_models/publish_view_model.dart';
import '../../view_models/novel_view_model.dart';
import '../widgets/cover_image.dart';
import '../widgets/profile_image.dart';
import '../main/publish_detail_view.dart';

class PublishView extends StatelessWidget {
  static String routeName = '/detail';
  const PublishView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
          _buildTop(),
          _buildBottom(),
          _myNovels(),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _myNovels extends StatelessWidget {
  const _myNovels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final novelViewModel = Provider.of<NovelViewModel>(context);
    final publishViewModel = Provider.of<PublishViewModel>(context);
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Flexible(
      child: novelViewModel.myNovels.isEmpty
          ? const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                  child: Text(
                'Anda Belum Membuat Novel',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                final novel = novelViewModel.myNovels[i];
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
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, PublishDetailView.routeName,
                        arguments: novel.id);
                  },
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Delete Novel'),
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
                                  // Fungsi Add to Library
                                  publishViewModel.deleteNovel(
                                      novelViewModel.myNovels[i].id);
                                  Navigator.pop(context);
                                  await Future.delayed(
                                    const Duration(
                                      milliseconds: 500,
                                    ),
                                  );
                                  await novelViewModel.init();
                                  novelViewModel
                                      .updateMyNovels(authViewModel.user.nama);
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
              itemCount: novelViewModel.myNovels.length,
            ),
    );
  }
}

// ignore: camel_case_types
class _buildBottom extends StatelessWidget {
  const _buildBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final novelViewModel = Provider.of<NovelViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            authViewModel.user.nama,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Novelis',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text('My Novels'),
            trailing: IconButton(
              icon: const Icon(
                Icons.sort_by_alpha,
              ),
              onPressed: () {
                if (novelViewModel.sortFromA == true) {
                  novelViewModel.sortNovel();
                  novelViewModel.sortFromA = false;
                } else {
                  novelViewModel.sortNovel();
                  novelViewModel.sortFromA = true;
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _buildTop extends StatelessWidget {
  const _buildTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authView = Provider.of<AuthViewModel>(context);
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 100),
            child: const CoverImage()),
        const Positioned(
          top: 160,
          child: ProfileImage(),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              primary: Colors.red.withOpacity(0.7),
            ),
            onPressed: () {
              authView.logOut();
            },
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(Icons.logout),
            ),
          ),
        ),
      ],
    );
  }
}
