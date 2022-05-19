import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novelku/view_models/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../view_models/novel_view_model.dart';
import '../../view_models/publish_view_model.dart';

class PostNovelView extends StatelessWidget {
  const PostNovelView({Key? key}) : super(key: key);
  static String routeName = '/post_novel';

  @override
  Widget build(BuildContext context) {
    var modelView = Provider.of<PublishViewModel>(context);
    var authViewModel = Provider.of<AuthViewModel>(context);
    var novelViewModel = Provider.of<NovelViewModel>(context);
    var judulController = TextEditingController();
    var authorController = TextEditingController();
    var sinopsisController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorPrimary1,
        body: Form(
          key: _formKey,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
            child: ListView(
              children: [
                Center(
                  child: Text(
                    'Upload Novel',
                    style: GoogleFonts.comfortaa(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    children: [
                      Column(children: [
                        // Comment this children for Widget Testing
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
                                  backgroundColor: colorPrimary4,
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
                  maxLines: 15,
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
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silahkan masukan nama Sinopsis';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: colorPrimary4,
                    textStyle: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      modelView.postNovel(
                        judulController.text,
                        sinopsisController.text,
                        authViewModel.user.nama,
                      );
                      Navigator.pop(context);
                      await Future.delayed(
                        const Duration(
                          milliseconds: 2000,
                        ),
                      );
                      await novelViewModel.init();
                      novelViewModel.updateMyNovels(authViewModel.user.nama);
                    }
                  },
                  child: const Text(
                    'Upload Novel',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
