// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Riwayat baca user.

@ProviderFor(HistoryController)
const historyControllerProvider = HistoryControllerProvider._();

/// Riwayat baca user.
final class HistoryControllerProvider
    extends $AsyncNotifierProvider<HistoryController, List<ReadingHistory>> {
  /// Riwayat baca user.
  const HistoryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyControllerHash();

  @$internal
  @override
  HistoryController create() => HistoryController();
}

String _$historyControllerHash() => r'83f93b805151b2f143675884d9654d9a5a45b043';

/// Riwayat baca user.

abstract class _$HistoryController
    extends $AsyncNotifier<List<ReadingHistory>> {
  FutureOr<List<ReadingHistory>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ReadingHistory>>, List<ReadingHistory>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ReadingHistory>>,
                List<ReadingHistory>
              >,
              AsyncValue<List<ReadingHistory>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
