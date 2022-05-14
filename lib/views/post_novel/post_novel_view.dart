import 'package:flutter/material.dart';
import 'package:novelku/view_models/home_view_model.dart';
import 'package:novelku/view_models/publish_view_model.dart';
import 'package:provider/provider.dart';

class PostNovelView extends StatelessWidget {
  const PostNovelView({Key? key}) : super(key: key);
  static String routeName = '/post_novel';

  @override
  Widget build(BuildContext context) {
    var modelView = Provider.of<PublishViewModel>(context);
    var homeViewModel = Provider.of<HomeViewModel>(context);
    var judulController = TextEditingController();
    var authorController = TextEditingController();
    var sinopsisController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
            child: ListView(
              children: [
                const Center(
                  child: Text(
                    'Select Cover Novel',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    children: [
                      Column(children: [
                        modelView.image != null
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: double.infinity,
                                height: 300,
                                child: Image.file(
                                  modelView.image!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: double.infinity,
                                height: 300,
                                child: Image.network(
                                  'https://picsum.photos/id/122/200/300',
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ]),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Center(
                            child: InkWell(
                                onTap: () {
                                  modelView.openGallery();
                                },
                                child: const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.green,
                                  child: Icon(Icons.camera_alt_rounded,
                                      color: Colors.white, size: 30),
                                ))),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: judulController,
                  decoration: InputDecoration(
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    hintText: "Masukan Judul Novel",
                    labelText: "Judul",
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silahkan masukan judul';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: authorController,
                  decoration: InputDecoration(
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    hintText: "Masukan Nama Author",
                    labelText: "Author",
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silahkan masukan nama author';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  maxLines: 30,
                  controller: sinopsisController,
                  decoration: InputDecoration(
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    hintText: "Masukan Sinopsis",
                    labelText: "Sinopsis",
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silahkan masukan nama author';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      modelView.postNovel(
                        judulController.text,
                        sinopsisController.text,
                        authorController.text,
                      );
                      Navigator.pop(context);
                      await Future.delayed(
                        const Duration(
                          milliseconds: 1000,
                        ),
                      );
                      homeViewModel.init();
                    }
                  },
                  child: const Text('Upload Novel'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
