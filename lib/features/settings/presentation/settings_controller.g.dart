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

/// Kontrol Mode Hemat Daya / Classic Mode (menonaktifkan partikel & shader spasial)

@ProviderFor(PowerSaverController)
const powerSaverControllerProvider = PowerSaverControllerProvider._();

/// Kontrol Mode Hemat Daya / Classic Mode (menonaktifkan partikel & shader spasial)
final class PowerSaverControllerProvider
    extends $AsyncNotifierProvider<PowerSaverController, bool> {
  /// Kontrol Mode Hemat Daya / Classic Mode (menonaktifkan partikel & shader spasial)
  const PowerSaverControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'powerSaverControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$powerSaverControllerHash();

  @$internal
  @override
  PowerSaverController create() => PowerSaverController();
}

String _$powerSaverControllerHash() =>
    r'79e4ec253db374f4c6b75f0f6b3b7927a0485892';

/// Kontrol Mode Hemat Daya / Classic Mode (menonaktifkan partikel & shader spasial)

abstract class _$PowerSaverController extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Kontrol Gaya Membaca (Spatial 3D Page Turn vs Classic Continuous Scroll)

@ProviderFor(ReadingStyleController)
const readingStyleControllerProvider = ReadingStyleControllerProvider._();

/// Kontrol Gaya Membaca (Spatial 3D Page Turn vs Classic Continuous Scroll)
final class ReadingStyleControllerProvider
    extends $AsyncNotifierProvider<ReadingStyleController, ReadingStyle> {
  /// Kontrol Gaya Membaca (Spatial 3D Page Turn vs Classic Continuous Scroll)
  const ReadingStyleControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'readingStyleControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$readingStyleControllerHash();

  @$internal
  @override
  ReadingStyleController create() => ReadingStyleController();
}

String _$readingStyleControllerHash() =>
    r'861b7bdc9ada7efdbc333a16e1c2b474c1f1c492';

/// Kontrol Gaya Membaca (Spatial 3D Page Turn vs Classic Continuous Scroll)

abstract class _$ReadingStyleController extends $AsyncNotifier<ReadingStyle> {
  FutureOr<ReadingStyle> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<ReadingStyle>, ReadingStyle>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ReadingStyle>, ReadingStyle>,
              AsyncValue<ReadingStyle>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Kontrol Efek Parallax Giroskop

@ProviderFor(GyroParallaxController)
const gyroParallaxControllerProvider = GyroParallaxControllerProvider._();

/// Kontrol Efek Parallax Giroskop
final class GyroParallaxControllerProvider
    extends $AsyncNotifierProvider<GyroParallaxController, bool> {
  /// Kontrol Efek Parallax Giroskop
  const GyroParallaxControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gyroParallaxControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gyroParallaxControllerHash();

  @$internal
  @override
  GyroParallaxController create() => GyroParallaxController();
}

String _$gyroParallaxControllerHash() =>
    r'5e9ffbe30f125fa732b46a2bf6974cda07dca062';

/// Kontrol Efek Parallax Giroskop

abstract class _$GyroParallaxController extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Kontrol Efek Ambient Lighting Dinamis

@ProviderFor(AmbientGlowController)
const ambientGlowControllerProvider = AmbientGlowControllerProvider._();

/// Kontrol Efek Ambient Lighting Dinamis
final class AmbientGlowControllerProvider
    extends $AsyncNotifierProvider<AmbientGlowController, bool> {
  /// Kontrol Efek Ambient Lighting Dinamis
  const AmbientGlowControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ambientGlowControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ambientGlowControllerHash();

  @$internal
  @override
  AmbientGlowController create() => AmbientGlowController();
}

String _$ambientGlowControllerHash() =>
    r'5b852f81ac1043a77d4b6512ecbc75a0703728cb';

/// Kontrol Efek Ambient Lighting Dinamis

abstract class _$AmbientGlowController extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Kontrol Override Tema Genre

@ProviderFor(GenreOverrideController)
const genreOverrideControllerProvider = GenreOverrideControllerProvider._();

/// Kontrol Override Tema Genre
final class GenreOverrideControllerProvider
    extends $AsyncNotifierProvider<GenreOverrideController, String?> {
  /// Kontrol Override Tema Genre
  const GenreOverrideControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'genreOverrideControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$genreOverrideControllerHash();

  @$internal
  @override
  GenreOverrideController create() => GenreOverrideController();
}

String _$genreOverrideControllerHash() =>
    r'aeab84da818b81f71105b8d14f6a34adffa9ff76';

/// Kontrol Override Tema Genre

abstract class _$GenreOverrideController extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
