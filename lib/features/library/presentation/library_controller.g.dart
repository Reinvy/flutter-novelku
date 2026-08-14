// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Daftar novel di perpustakaan user.

@ProviderFor(LibraryController)
const libraryControllerProvider = LibraryControllerProvider._();

/// Daftar novel di perpustakaan user.
final class LibraryControllerProvider
    extends $AsyncNotifierProvider<LibraryController, List<Novel>> {
  /// Daftar novel di perpustakaan user.
  const LibraryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'libraryControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$libraryControllerHash();

  @$internal
  @override
  LibraryController create() => LibraryController();
}

String _$libraryControllerHash() => r'25de4e40372d3f0dcb62b1c7dccf1a38af11f5fb';

/// Daftar novel di perpustakaan user.

abstract class _$LibraryController extends $AsyncNotifier<List<Novel>> {
  FutureOr<List<Novel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Novel>>, List<Novel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Novel>>, List<Novel>>,
              AsyncValue<List<Novel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
