import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/storage/settings_storage.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/loading_view.dart';
import '../../../shared/models/chapter.dart';
import '../../library/data/user_data_repository.dart';
import '../../explore/data/novel_repository.dart';

class ReaderScreen extends ConsumerStatefulWidget {
  const ReaderScreen({super.key, required this.novelId, required this.chapterId});

  final String novelId;
  final String chapterId;

  @override
  ConsumerState<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends ConsumerState<ReaderScreen> {
  Timer? _historyDebounce;

  @override
  void initState() {
    super.initState();
    _scheduleHistorySave();
  }

  @override
  void dispose() {
    _historyDebounce?.cancel();
    _flushHistory();
    super.dispose();
  }

  void _scheduleHistorySave() {
    _historyDebounce?.cancel();
    _historyDebounce = Timer(const Duration(seconds: 3), _flushHistory);
  }

  Future<void> _flushHistory() async {
    try {
      await ref.read(userDataRepositoryProvider).updateHistory(
            novelId: widget.novelId,
            chapterId: widget.chapterId,
            progress: 0,
          );
    } catch (_) {
      // History gagal disimpan — abaikan agar tidak mengganggu baca.
    }
  }

  @override
  Widget build(BuildContext context) {
    final chapter = ref.watch(chapterProvider(widget.chapterId));

    return chapter.when(
      loading: () => const Scaffold(body: LoadingView()),
      error: (e, _) => Scaffold(
        body: ErrorView(
          message: 'Gagal memuat bab',
          onRetry: () => ref.invalidate(chapterProvider(widget.chapterId)),
        ),
      ),
      data: (data) => _ReaderBody(
        chapter: data,
        novelId: widget.novelId,
        onScroll: _scheduleHistorySave,
      ),
    );
  }
}

/// Provider bab individual (family).
final chapterProvider = FutureProvider.family<Chapter, String>((ref, chapterId) {
  return ref.watch(novelRepositoryProvider).getChapter(chapterId);
});

class _ReaderBody extends ConsumerStatefulWidget {
  const _ReaderBody({required this.chapter, required this.novelId, required this.onScroll});

  final Chapter chapter;
  final String novelId;
  final VoidCallback onScroll;

  @override
  ConsumerState<_ReaderBody> createState() => _ReaderBodyState();
}

class _ReaderBodyState extends ConsumerState<_ReaderBody> {
  late double _fontSize;
  late ReaderMode _mode;
  bool _bookmarked = false;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
    _checkBookmark();
    _scrollController.addListener(() {
      widget.onScroll();
    });
  }

  Future<void> _loadSettings() async {
    final storage = ref.read(settingsStorageProvider);
    final size = await storage.readReaderFontSize();
    final mode = await storage.readReaderMode();
    if (mounted) {
      setState(() {
        _fontSize = size;
        _mode = mode;
      });
    }
  }

  Future<void> _checkBookmark() async {
    final repo = ref.read(userDataRepositoryProvider);
    try {
      final bookmarks = await repo.getBookmarks();
      if (mounted) {
        setState(() {
          _bookmarked = bookmarks.any((b) => b.id == widget.chapter.id);
        });
      }
    } catch (_) {
      // abaikan
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _changeFontSize(double delta) async {
    final newSize = (_fontSize + delta).clamp(14.0, 28.0);
    setState(() => _fontSize = newSize);
    await ref.read(settingsStorageProvider).writeReaderFontSize(newSize);
  }

  Future<void> _changeMode(ReaderMode mode) async {
    setState(() => _mode = mode);
    await ref.read(settingsStorageProvider).writeReaderMode(mode);
  }

  Future<void> _toggleBookmark() async {
    final repo = ref.read(userDataRepositoryProvider);
    try {
      if (_bookmarked) {
        await repo.removeBookmark(widget.chapter.id);
      } else {
        await repo.addBookmark(widget.chapter.id);
      }
      if (mounted) setState(() => _bookmarked = !_bookmarked);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_bookmarked ? 'Bab ditambahkan ke bookmark' : 'Bookmark dihapus'),
            duration: const Duration(seconds: 1),
          ),
        );
      }
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bg = _mode.background;
    final fg = _mode.textColor;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        foregroundColor: fg,
        title: Text(
          widget.chapter.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: fg),
        ),
        actions: [
          IconButton(
            tooltip: 'Bookmark',
            icon: Icon(
              _bookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
              color: _bookmarked ? Theme.of(context).colorScheme.primary : fg,
            ),
            onPressed: _toggleBookmark,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chapter.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: fg,
                      fontFamily: 'Georgia',
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    widget.chapter.content,
                    style: AppTypography.reader(_fontSize, fg),
                  ),
                ],
              ),
            ),
          ),
          _ReaderToolbar(
            fontSize: _fontSize,
            mode: _mode,
            onFontSizeChanged: _changeFontSize,
            onModeChanged: _changeMode,
          ),
        ],
      ),
    );
  }
}

class _ReaderToolbar extends StatelessWidget {
  const _ReaderToolbar({
    required this.fontSize,
    required this.mode,
    required this.onFontSizeChanged,
    required this.onModeChanged,
  });

  final double fontSize;
  final ReaderMode mode;
  final ValueChanged<double> onFontSizeChanged;
  final ValueChanged<ReaderMode> onModeChanged;

  @override
  Widget build(BuildContext context) {
    final bg = mode.background;
    final fg = mode.textColor;

    return Container(
      color: bg,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            IconButton(
              tooltip: 'Kurangi ukuran huruf',
              icon: Icon(Icons.text_decrease_rounded, color: fg),
              onPressed: () => onFontSizeChanged(-1),
            ),
            Text('${fontSize.round()}', style: TextStyle(color: fg, fontWeight: FontWeight.w600)),
            IconButton(
              tooltip: 'Perbesar ukuran huruf',
              icon: Icon(Icons.text_increase_rounded, color: fg),
              onPressed: () => onFontSizeChanged(1),
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Mode terang',
              icon: Icon(Icons.light_mode_outlined, color: fg),
              onPressed: () => onModeChanged(ReaderMode.light),
            ),
            IconButton(
              tooltip: 'Mode sepia',
              icon: Icon(Icons.local_cafe_outlined, color: fg),
              onPressed: () => onModeChanged(ReaderMode.sepia),
            ),
            IconButton(
              tooltip: 'Mode gelap',
              icon: Icon(Icons.dark_mode_outlined, color: fg),
              onPressed: () => onModeChanged(ReaderMode.dark),
            ),
          ],
        ),
      ),
    );
  }
}
