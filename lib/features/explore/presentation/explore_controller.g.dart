// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExploreController)
const exploreControllerProvider = ExploreControllerProvider._();

final class ExploreControllerProvider
    extends $AsyncNotifierProvider<ExploreController, List<Novel>> {
  const ExploreControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'exploreControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$exploreControllerHash();

  @$internal
  @override
  ExploreController create() => ExploreController();
}

String _$exploreControllerHash() => r'a05200f341809ea08f00140216a856ed65673122';

abstract class _$ExploreController extends $AsyncNotifier<List<Novel>> {
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
