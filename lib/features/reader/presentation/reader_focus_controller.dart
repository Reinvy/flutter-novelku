import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State kontrol mode imersi / fokus membaca
class ReaderFocusState {
  const ReaderFocusState({
    required this.isImmersiveFocus,
    required this.isControlsVisible,
  });

  final bool isImmersiveFocus;
  final bool isControlsVisible;

  ReaderFocusState copyWith({
    bool? isImmersiveFocus,
    bool? isControlsVisible,
  }) {
    return ReaderFocusState(
      isImmersiveFocus: isImmersiveFocus ?? this.isImmersiveFocus,
      isControlsVisible: isControlsVisible ?? this.isControlsVisible,
    );
  }
}

class ReaderFocusNotifier extends Notifier<ReaderFocusState> {
  @override
  ReaderFocusState build() {
    return const ReaderFocusState(
      isImmersiveFocus: false,
      isControlsVisible: true,
    );
  }

  /// Masuk ke Focus Mode (Pinch-out)
  void enterFocusMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    state = state.copyWith(
      isImmersiveFocus: true,
      isControlsVisible: false,
    );
  }

  /// Keluar dari Focus Mode (Pinch-in atau restore)
  void exitFocusMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    state = state.copyWith(
      isImmersiveFocus: false,
      isControlsVisible: true,
    );
  }

  /// Toggle kontrol saat tap di tengah layar
  void toggleControls() {
    if (state.isImmersiveFocus) {
      exitFocusMode();
    } else {
      state = state.copyWith(
        isControlsVisible: !state.isControlsVisible,
      );
    }
  }
}

final readerFocusProvider = NotifierProvider<ReaderFocusNotifier, ReaderFocusState>(
  ReaderFocusNotifier.new,
);
