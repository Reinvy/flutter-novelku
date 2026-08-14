// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Preferensi tema global (light/dark/system), dipersist.

@ProviderFor(ThemeModeController)
const themeModeControllerProvider = ThemeModeControllerProvider._();

/// Preferensi tema global (light/dark/system), dipersist.
final class ThemeModeControllerProvider
    extends $AsyncNotifierProvider<ThemeModeController, ThemeMode> {
  /// Preferensi tema global (light/dark/system), dipersist.
  const ThemeModeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModeControllerHash();

  @$internal
  @override
  ThemeModeController create() => ThemeModeController();
}

String _$themeModeControllerHash() =>
    r'8c68ea5874064624a034f1d1a930ac970490ec1e';

/// Preferensi tema global (light/dark/system), dipersist.

abstract class _$ThemeModeController extends $AsyncNotifier<ThemeMode> {
  FutureOr<ThemeMode> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<ThemeMode>, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ThemeMode>, ThemeMode>,
              AsyncValue<ThemeMode>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
