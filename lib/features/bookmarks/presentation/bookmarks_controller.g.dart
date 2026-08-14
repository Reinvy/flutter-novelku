// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmarks_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Daftar bookmark bab user.

@ProviderFor(BookmarksController)
const bookmarksControllerProvider = BookmarksControllerProvider._();

/// Daftar bookmark bab user.
final class BookmarksControllerProvider
    extends $AsyncNotifierProvider<BookmarksController, List<Bookmark>> {
  /// Daftar bookmark bab user.
  const BookmarksControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookmarksControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookmarksControllerHash();

  @$internal
  @override
  BookmarksController create() => BookmarksController();
}

String _$bookmarksControllerHash() =>
    r'06c760de96454db234ba522c2878c60b6067fd84';

/// Daftar bookmark bab user.

abstract class _$BookmarksController extends $AsyncNotifier<List<Bookmark>> {
  FutureOr<List<Bookmark>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Bookmark>>, List<Bookmark>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Bookmark>>, List<Bookmark>>,
              AsyncValue<List<Bookmark>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
