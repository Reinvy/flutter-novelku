class NovelModel {
  String id;
  String judul;
  String author;
  String status;
  String sinopsis;
  String linkImage;
  List<ChapterModel> chapter;

  NovelModel({
    required this.id,
    required this.judul,
    required this.author,
    required this.status,
    required this.sinopsis,
    required this.linkImage,
    required this.chapter,
  });
}

class ChapterModel {
  String id;
  String judulChapter;
  String content;

  ChapterModel({
    required this.id,
    required this.judulChapter,
    required this.content,
  });
}
