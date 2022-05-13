import 'package:flutter/material.dart';

import 'package:novelku/view_models/auth_view_model.dart';
import 'package:novelku/view_models/publish_view_model.dart';

import 'package:novelku/view_models/home_view_model.dart';

import 'package:novelku/views/publish/widgets/cover_image.dart';
import 'package:novelku/views/publish/widgets/profile_image.dart';

import 'package:novelku/views/publish_detail/publish_detail_view.dart';
import 'package:provider/provider.dart';

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
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final publishViewModel = Provider.of<PublishViewModel>(context);

    return Flexible(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          final novel = homeViewModel.novels[i];
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
                            publishViewModel
                                .deleteNovel(homeViewModel.novels[i].id);
                            Navigator.pop(context);
                            await Future.delayed(
                              const Duration(
                                milliseconds: 500,
                              ),
                            );
                            homeViewModel.init();
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
        itemCount: homeViewModel.novels.length,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            authViewModel.myEmail!,
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
              icon: const Icon(Icons.sort_by_alpha),
              onPressed: () {
                // if (sortFromA == true) {
                //   homeViewModel.sortnovels(sortFromA);
                //   sortFromA = false;
                // } else {
                //   homeViewModel.sortnovels(sortFromA);
                //   sortFromA = true;
                // }
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
