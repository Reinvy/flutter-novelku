import 'package:novelku/models/api/novel_api.dart';
import 'package:novelku/models/novel_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'novel_api_test.mocks.dart';

@GenerateMocks([NovelApi])
void main() {
  group('Novel API', () {
    NovelApi novelAPI = MockNovelApi();
    test('Get all novel return data', () async {
      when(novelAPI.getNovels())
          .thenAnswer((realInvocation) async => <NovelModel>[
                NovelModel(
                  id: '1',
                  judul: 'judul',
                  author: 'author',
                  status: 'status',
                  sinopsis: 'sinopsis',
                  linkImage: 'linkImage',
                  chapter: <ChapterModel>[
                    ChapterModel(
                      id: 'id',
                      judulChapter: 'judulChapter',
                      content: 'content',
                    ),
                  ],
                )
              ]);

      var novels = await novelAPI.getNovels();
      expect(novels.isNotEmpty, true);
    });
  });
}
