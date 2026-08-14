// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novel_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Detail novel + rating + komentar.

@ProviderFor(NovelDetailController)
const novelDetailControllerProvider = NovelDetailControllerFamily._();

/// Detail novel + rating + komentar.
final class NovelDetailControllerProvider
    extends $AsyncNotifierProvider<NovelDetailController, NovelDetail> {
  /// Detail novel + rating + komentar.
  const NovelDetailControllerProvider._({
    required NovelDetailControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'novelDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$novelDetailControllerHash();

  @override
  String toString() {
    return r'novelDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  NovelDetailController create() => NovelDetailController();

  @override
  bool operator ==(Object other) {
    return other is NovelDetailControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$novelDetailControllerHash() =>
    r'1c7ed17f6610835d726d711fe0442d6309a87820';

/// Detail novel + rating + komentar.

final class NovelDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          NovelDetailController,
          AsyncValue<NovelDetail>,
          NovelDetail,
          FutureOr<NovelDetail>,
          String
        > {
  const NovelDetailControllerFamily._()
    : super(
        retry: null,
        name: r'novelDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Detail novel + rating + komentar.

  NovelDetailControllerProvider call(String novelId) =>
      NovelDetailControllerProvider._(argument: novelId, from: this);

  @override
  String toString() => r'novelDetailControllerProvider';
}

/// Detail novel + rating + komentar.

abstract class _$NovelDetailController extends $AsyncNotifier<NovelDetail> {
  late final _$args = ref.$arg as String;
  String get novelId => _$args;

  FutureOr<NovelDetail> build(String novelId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<NovelDetail>, NovelDetail>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<NovelDetail>, NovelDetail>,
              AsyncValue<NovelDetail>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Rating user saat ini + aggregate.

@ProviderFor(RatingController)
const ratingControllerProvider = RatingControllerFamily._();

/// Rating user saat ini + aggregate.
final class RatingControllerProvider
    extends $AsyncNotifierProvider<RatingController, RatingInfo> {
  /// Rating user saat ini + aggregate.
  const RatingControllerProvider._({
    required RatingControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'ratingControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ratingControllerHash();

  @override
  String toString() {
    return r'ratingControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RatingController create() => RatingController();

  @override
  bool operator ==(Object other) {
    return other is RatingControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ratingControllerHash() => r'41aa23ca38e2ef87e88594cb473b3977ab0fe860';

/// Rating user saat ini + aggregate.

final class RatingControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          RatingController,
          AsyncValue<RatingInfo>,
          RatingInfo,
          FutureOr<RatingInfo>,
          String
        > {
  const RatingControllerFamily._()
    : super(
        retry: null,
        name: r'ratingControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Rating user saat ini + aggregate.

  RatingControllerProvider call(String novelId) =>
      RatingControllerProvider._(argument: novelId, from: this);

  @override
  String toString() => r'ratingControllerProvider';
}

/// Rating user saat ini + aggregate.

abstract class _$RatingController extends $AsyncNotifier<RatingInfo> {
  late final _$args = ref.$arg as String;
  String get novelId => _$args;

  FutureOr<RatingInfo> build(String novelId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<RatingInfo>, RatingInfo>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RatingInfo>, RatingInfo>,
              AsyncValue<RatingInfo>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Komentar novel (paginasi).

@ProviderFor(CommentsController)
const commentsControllerProvider = CommentsControllerFamily._();

/// Komentar novel (paginasi).
final class CommentsControllerProvider
    extends $AsyncNotifierProvider<CommentsController, List<Comment>> {
  /// Komentar novel (paginasi).
  const CommentsControllerProvider._({
    required CommentsControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'commentsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentsControllerHash();

  @override
  String toString() {
    return r'commentsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CommentsController create() => CommentsController();

  @override
  bool operator ==(Object other) {
    return other is CommentsControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentsControllerHash() =>
    r'd124b63c7bd46c6d6eca0ca4fffdf011491e20ee';

/// Komentar novel (paginasi).

final class CommentsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          CommentsController,
          AsyncValue<List<Comment>>,
          List<Comment>,
          FutureOr<List<Comment>>,
          String
        > {
  const CommentsControllerFamily._()
    : super(
        retry: null,
        name: r'commentsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Komentar novel (paginasi).

  CommentsControllerProvider call(String novelId) =>
      CommentsControllerProvider._(argument: novelId, from: this);

  @override
  String toString() => r'commentsControllerProvider';
}

/// Komentar novel (paginasi).

abstract class _$CommentsController extends $AsyncNotifier<List<Comment>> {
  late final _$args = ref.$arg as String;
  String get novelId => _$args;

  FutureOr<List<Comment>> build(String novelId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<List<Comment>>, List<Comment>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Comment>>, List<Comment>>,
              AsyncValue<List<Comment>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
