import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:novelku/features/explore/data/novel_repository.dart';
import 'package:novelku/features/explore/presentation/explore_controller.dart';
import 'package:novelku/shared/models/author.dart';
import 'package:novelku/shared/models/novel.dart';
import 'package:novelku/shared/models/paged_response.dart';

class MockNovelRepository extends Mock implements NovelRepository {}

void main() {
  late MockNovelRepository repository;

  setUp(() {
    repository = MockNovelRepository();
  });

  test('ExploreController memuat novel dan mendukung search', () async {
    final novel = Novel(
      id: '1',
      title: 'Senja di Ujung Kota',
      synopsis: 'Sinopsis',
      status: 'ONGOING',
      author: const Author(id: 'a1', name: 'Penulis'),
      chapterCount: 3,
      ratingCount: 2,
      averageRating: 4.5,
    );

    when(() => repository.listNovels(
          search: any(named: 'search'),
          status: any(named: 'status'),
          authorId: any(named: 'authorId'),
          sort: any(named: 'sort'),
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
        )).thenAnswer((_) async => PagedResponse<Novel>(
          items: [novel],
          meta: const PageMeta(page: 1, pageSize: 10, total: 1, totalPages: 1),
        ));

    final container = ProviderContainer(
      overrides: [
        novelRepositoryProvider.overrideWithValue(repository),
      ],
    );
    addTearDown(container.dispose);

    final controller = container.read(exploreControllerProvider.notifier);
    final result = await controller.future;

    expect(result, hasLength(1));
    expect(result.first.title, 'Senja di Ujung Kota');
    expect(result.first.averageRating, 4.5);
    expect(result.first.isCompleted, false);
  });
}
