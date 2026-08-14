// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Novel karya user (penulis).

@ProviderFor(MyNovelsController)
const myNovelsControllerProvider = MyNovelsControllerProvider._();

/// Novel karya user (penulis).
final class MyNovelsControllerProvider
    extends $AsyncNotifierProvider<MyNovelsController, List<Novel>> {
  /// Novel karya user (penulis).
  const MyNovelsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myNovelsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myNovelsControllerHash();

  @$internal
  @override
  MyNovelsController create() => MyNovelsController();
}

String _$myNovelsControllerHash() =>
    r'54610bbae05f5d9ea5af596f3ab2892acaf321fd';

/// Novel karya user (penulis).

abstract class _$MyNovelsController extends $AsyncNotifier<List<Novel>> {
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
