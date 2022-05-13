import 'package:firebase_storage/firebase_storage.dart';

class CloudStorage {
  static uploadImage(String destination, image) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    final ref = storage.ref(destination);
    await ref.putFile(image);
    var linkImage = await ref.getDownloadURL();

    return linkImage;
  }
}
