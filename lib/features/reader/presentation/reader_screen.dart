import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/storage/settings_storage.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/theme/spatial_tokens.dart';
import '../../../core/widgets/dynamic_ambient_glow.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/genre_atmosphere_canvas.dart';
import '../../../core/widgets/interactive_divider.dart';
import '../../../core/widgets/loading_view.dart';
import '../../../shared/models/chapter.dart';
import '../../../shared/models/novel_detail.dart';
import '../../explore/data/novel_repository.dart';
import '../../library/data/user_data_repository.dart';
import '../../novel_detail/presentation/novel_detail_controller.dart';
import '../../settings/presentation/settings_controller.dart';
import 'arc_chapter_carousel.dart';
import 'mood_analyzer.dart';
import 'physical_ribbon_bookmark.dart';
import 'reader_focus_controller.dart';
import 'spatial_page_turn.dart';

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
      // Abaikan jika offline / gagal simpan
    }
  }

  @override
  Widget build(BuildContext context) {
    final chapter = ref.watch(chapterProvider(widget.chapterId));
    final novelDetail = ref.watch(novelDetailControllerProvider(widget.novelId));

    return chapter.when(
      loading: () => const Scaffold(body: LoadingView()),
      error: (e, _) => Scaffold(
        body: ErrorView(
          message: 'Gagal memuat bab',
          onRetry: () => ref.invalidate(chapterProvider(widget.chapterId)),
        ),
      ),
      data: (chapterData) => _TheStoryRoom(
        chapter: chapterData,
        novelId: widget.novelId,
        novelDetail: novelDetail.value,
        onProgress: _scheduleHistorySave,
      ),
    );
  }
}

/// Provider bab individual (family)
final chapterProvider = FutureProvider.family<Chapter, String>((ref, chapterId) {
  return ref.watch(novelRepositoryProvider).getChapter(chapterId);
});

/// The Story Room — Lingkungan Membaca Spasial & Imersif
class _TheStoryRoom extends ConsumerStatefulWidget {
  const _TheStoryRoom({
    required this.chapter,
    required this.novelId,
    this.novelDetail,
    required this.onProgress,
  });

  final Chapter chapter;
  final String novelId;
  final NovelDetail? novelDetail;
  final VoidCallback onProgress;

  @override
  ConsumerState<_TheStoryRoom> createState() => _TheStoryRoomState();
}

class _TheStoryRoomState extends ConsumerState<_TheStoryRoom> {
  late double _fontSize;
  late ReaderMode _mode;
  bool _bookmarked = false;
  int _currentPageIndex = 0;
  List<String> _paginatedPages = [];
  ContentMood _currentMood = ContentMood.neutral;

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fontSize = 18.0;
    _mode = ReaderMode.light;
    _loadSettings();
    _checkBookmark();
    _paginateContent();
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
      _paginateContent();
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
      // Abaikan
    }
  }

  void _paginateContent() {
    final content = widget.chapter.content;
    if (content.isEmpty) {
      _paginatedPages = ['(Bab ini belum memiliki isi)'];
      return;
    }

    // Pemecahan paragraf dinamis ke dalam halaman-halaman spasial yang proporsional
    final paragraphs = content.split('\n\n');
    final List<String> pages = [];
    StringBuffer currentBuffer = StringBuffer();
    // Perkiraan kapasitas karakter per halaman berdasarkan ukuran font
    final maxCharsPerPage = (12000 / _fontSize).round();

    for (final p in paragraphs) {
      final trimmed = p.trim();
      if (trimmed.isEmpty) continue;

      if (currentBuffer.length + trimmed.length > maxCharsPerPage && currentBuffer.isNotEmpty) {
        pages.add(currentBuffer.toString().trim());
        currentBuffer = StringBuffer();
      }
      currentBuffer.writeln(trimmed);
      currentBuffer.writeln();
    }

    if (currentBuffer.isNotEmpty) {
      pages.add(currentBuffer.toString().trim());
    }

    _paginatedPages = pages.isNotEmpty ? pages : [content];
    _updateMoodForPage(_currentPageIndex);
  }

  void _updateMoodForPage(int pageIndex) {
    if (pageIndex >= 0 && pageIndex < _paginatedPages.length) {
      final text = _paginatedPages[pageIndex];
      final mood = MoodAnalyzer.analyzeText(text);
      if (mood != _currentMood) {
        setState(() {
          _currentMood = mood;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _changeFontSize(double delta) async {
    final newSize = (_fontSize + delta).clamp(14.0, 28.0);
    setState(() {
      _fontSize = newSize;
    });
    _paginateContent();
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
            content: Text(_bookmarked ? 'Pita penanda terpasang di bab ini' : 'Penanda dilepas'),
            duration: const Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
      }
    }
  }

  void _openChapterCarousel() {
    final chapters = widget.novelDetail?.chapters;
    if (chapters == null || chapters.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Daftar bab tidak tersedia')),
      );
      return;
    }

    final genreConfig = _resolveGenreConfig();
    ArcChapterCarouselSheet.show(
      context,
      chapters: chapters,
      currentChapterId: widget.chapter.id,
      accentColor: genreConfig.accentGlow,
      onChapterSelected: (selectedChapter) {
        if (selectedChapter.id != widget.chapter.id) {
          ref.invalidate(chapterProvider(selectedChapter.id));
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ReaderScreen(
                novelId: widget.novelId,
                chapterId: selectedChapter.id,
              ),
            ),
          );
        }
      },
    );
  }

  GenreVisualConfig _resolveGenreConfig() {
    final override = ref.watch(genreOverrideControllerProvider).value;
    if (override != null) {
      return GenreVisualConfig.fromGenreString(override);
    }
    final synopsis = widget.novelDetail?.synopsis ?? '';
    return GenreVisualConfig.fromGenreString(synopsis);
  }

  @override
  Widget build(BuildContext context) {
    final focusState = ref.watch(readerFocusProvider);
    final readingStyle = ref.watch(readingStyleControllerProvider).value ?? ReadingStyle.spatialPageTurn;
    final isPowerSaver = ref.watch(powerSaverControllerProvider).value ?? false;
    final genreConfig = _resolveGenreConfig();

    final bg = _mode.background;
    final fg = _mode.textColor;

    return Scaffold(
      backgroundColor: bg,
      body: GestureDetector(
        // Gestur Pinch-to-Immerse: Pinch-out masuk Focus Mode, Pinch-in keluar Focus Mode
        onScaleUpdate: (details) {
          if (details.scale > 1.25 && !focusState.isImmersiveFocus) {
            ref.read(readerFocusProvider.notifier).enterFocusMode();
          } else if (details.scale < 0.85 && focusState.isImmersiveFocus) {
            ref.read(readerFocusProvider.notifier).exitFocusMode();
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 1. Kanvas Atmosfer Genre di Belakang Teks (Fantasy fog / SciFi grid / Romance bokeh / Mystery vignette)
            if (!isPowerSaver && _mode == ReaderMode.light)
              Positioned.fill(
                child: Opacity(
                  opacity: 0.85,
                  child: GenreAtmosphereCanvas(genreConfig: genreConfig),
                ),
              ),

            // 2. Mesin Pencahayaan Ambient Dinamis (Edge-Glow yang bereaksi terhadap Mood teks)
            Positioned.fill(
              child: DynamicAmbientGlow(
                mood: _currentMood,
                child: SafeArea(
                  top: !focusState.isImmersiveFocus,
                  bottom: !focusState.isImmersiveFocus,
                  child: Column(
                    children: [
                      // Area Konten Bacaan Utama (Spatial Page Turn atau Continuous Scroll)
                      Expanded(
                        child: readingStyle == ReadingStyle.spatialPageTurn
                            ? SpatialPageTurnWidget(
                                pages: _paginatedPages,
                                fontSize: _fontSize,
                                textColor: fg,
                                backgroundColor: bg.withValues(alpha: 0.92),
                                initialPage: _currentPageIndex,
                                onPageChanged: (newIndex) {
                                  setState(() => _currentPageIndex = newIndex);
                                  _updateMoodForPage(newIndex);
                                  widget.onProgress();
                                },
                                onTapCenter: () {
                                  ref.read(readerFocusProvider.notifier).toggleControls();
                                },
                              )
                            : SingleChildScrollView(
                                controller: _scrollController,
                                padding: const EdgeInsets.fromLTRB(
                                  AppSpacing.lg,
                                  AppSpacing.md,
                                  AppSpacing.lg,
                                  AppSpacing.xl,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.chapter.title,
                                      style: AppTypography.spatialChapterTitle(fg),
                                    ),
                                    const SizedBox(height: AppSpacing.lg),
                                    Text(
                                      widget.chapter.content,
                                      style: focusState.isImmersiveFocus
                                          ? AppTypography.spatialFocusReader(_fontSize, fg)
                                          : AppTypography.reader(_fontSize, fg),
                                    ),
                                    InteractiveChapterDivider(
                                      accentColor: genreConfig.accentGlow,
                                      title: widget.chapter.title,
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 3. Pita Bookmark Kain Fisik 3D (Bisa ditarik ke bawah dari sudut kanan atas)
            PhysicalRibbonBookmark(
              isBookmarked: _bookmarked,
              onToggleBookmark: _toggleBookmark,
            ),

            // 4. Header Bar Atas (Menghilang halus pada Focus Mode)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              top: focusState.isControlsVisible ? 0 : -90,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      bg.withValues(alpha: 0.95),
                      bg.withValues(alpha: 0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  foregroundColor: fg,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.chapter.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: fg),
                      ),
                      Text(
                        'Bab ${widget.chapter.order} • ${genreConfig.name}',
                        style: TextStyle(fontSize: 11, color: fg.withValues(alpha: 0.6)),
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      tooltip: 'Portal Bab 3D',
                      icon: Icon(Icons.view_carousel_rounded, color: genreConfig.accentGlow),
                      onPressed: _openChapterCarousel,
                    ),
                    IconButton(
                      tooltip: 'Focus Mode (Pinch-to-Immerse)',
                      icon: const Icon(Icons.fullscreen_rounded),
                      onPressed: () => ref.read(readerFocusProvider.notifier).enterFocusMode(),
                    ),
                  ],
                ),
              ),
            ),

            // 5. Floating Reader Toolbar Bawah (Menghilang halus pada Focus Mode)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              bottom: focusState.isControlsVisible ? 0 : -140,
              left: 0,
              right: 0,
              child: _StoryRoomToolbar(
                fontSize: _fontSize,
                mode: _mode,
                readingStyle: readingStyle,
                genreConfig: genreConfig,
                onFontSizeChanged: _changeFontSize,
                onModeChanged: _changeMode,
                onToggleReadingStyle: (style) {
                  ref.read(readingStyleControllerProvider.notifier).set(style);
                },
                onOpenChapterCarousel: _openChapterCarousel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Bilah alat pembaca imersif dengan kontrol gaya baca spasial, ukuran huruf, dan tema
class _StoryRoomToolbar extends ConsumerWidget {
  const _StoryRoomToolbar({
    required this.fontSize,
    required this.mode,
    required this.readingStyle,
    required this.genreConfig,
    required this.onFontSizeChanged,
    required this.onModeChanged,
    required this.onToggleReadingStyle,
    required this.onOpenChapterCarousel,
  });

  final double fontSize;
  final ReaderMode mode;
  final ReadingStyle readingStyle;
  final GenreVisualConfig genreConfig;
  final ValueChanged<double> onFontSizeChanged;
  final ValueChanged<ReaderMode> onModeChanged;
  final ValueChanged<ReadingStyle> onToggleReadingStyle;
  final VoidCallback onOpenChapterCarousel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bg = mode.background;
    final fg = mode.textColor;

    return Container(
      decoration: BoxDecoration(
        color: bg.withValues(alpha: 0.95),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(
          color: genreConfig.accentGlow.withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                // Pengatur Ukuran Huruf
                IconButton(
                  tooltip: 'Kecilkan teks',
                  icon: Icon(Icons.text_decrease_rounded, color: fg),
                  onPressed: () => onFontSizeChanged(-1),
                ),
                Text(
                  '${fontSize.round()}',
                  style: TextStyle(color: fg, fontWeight: FontWeight.w700, fontSize: 13),
                ),
                IconButton(
                  tooltip: 'Besarkan teks',
                  icon: Icon(Icons.text_increase_rounded, color: fg),
                  onPressed: () => onFontSizeChanged(1),
                ),

                const Spacer(),

                // Toggle Gaya Membaca (3D Page Turn vs Continuous Scroll)
                IconButton(
                  tooltip: readingStyle == ReadingStyle.spatialPageTurn
                      ? 'Gaya: Pembalikan Halaman 3D'
                      : 'Gaya: Gulir Vertikal',
                  icon: Icon(
                    readingStyle == ReadingStyle.spatialPageTurn
                        ? Icons.auto_stories_rounded
                        : Icons.format_line_spacing_rounded,
                    color: genreConfig.accentGlow,
                  ),
                  onPressed: () {
                    final next = readingStyle == ReadingStyle.spatialPageTurn
                        ? ReadingStyle.continuousScroll
                        : ReadingStyle.spatialPageTurn;
                    onToggleReadingStyle(next);
                  },
                ),

                // Tombol Pintu Bab
                IconButton(
                  tooltip: 'Pintu Portal Bab',
                  icon: Icon(Icons.grid_view_rounded, color: fg),
                  onPressed: onOpenChapterCarousel,
                ),

                const Spacer(),

                // Pemilihan Mode Terang / Sepia / Gelap
                IconButton(
                  tooltip: 'Mode Terang',
                  icon: Icon(
                    mode == ReaderMode.light ? Icons.light_mode_rounded : Icons.light_mode_outlined,
                    color: mode == ReaderMode.light ? Theme.of(context).colorScheme.primary : fg,
                  ),
                  onPressed: () => onModeChanged(ReaderMode.light),
                ),
                IconButton(
                  tooltip: 'Mode Sepia',
                  icon: Icon(
                    mode == ReaderMode.sepia ? Icons.local_cafe_rounded : Icons.local_cafe_outlined,
                    color: mode == ReaderMode.sepia ? Colors.brown : fg,
                  ),
                  onPressed: () => onModeChanged(ReaderMode.sepia),
                ),
                IconButton(
                  tooltip: 'Mode Gelap',
                  icon: Icon(
                    mode == ReaderMode.dark ? Icons.dark_mode_rounded : Icons.dark_mode_outlined,
                    color: mode == ReaderMode.dark ? Theme.of(context).colorScheme.primary : fg,
                  ),
                  onPressed: () => onModeChanged(ReaderMode.dark),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
