part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin5 on _YasserDossariQuranPageState {
  Future<void> _confirmDeleteDownload(
    DownloadedQuran item,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: const Text(
            'حذف السورة؟',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: QuranTheme.darkGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'هل تريد حذف سورة ${item.surahName} '
            'بصوت ${item.reciterName} من الجهاز؟',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black54,
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx, false);
              },
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx, true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text('حذف'),
            ),
          ],
        );
      },
    );

    if (result == true) {
      await _removeDownloadedQuran(item);
    }
  }

  // ==========================================================================
  // تغيير القارئ
  // ==========================================================================

  Future<void> _changeReciter(
    Reciter reciter,
  ) async {
    await _audioPlayer.stop();

    setState(() {
      _selectedReciter = reciter;
      _currentSurahIndex = null;
      _currentReciterId = null;
      _isPlaying = false;
      _position = Duration.zero;
      _duration = Duration.zero;
    });
  }

  // ==========================================================================
  // الصفحات
  // ==========================================================================

  Future<void> _loadSavedPage() async {
    final prefs =
        await SharedPreferences.getInstance();

    final page =
        prefs.getInt('last_quran_page') ?? 1;

    _currentPage =
        page.clamp(1, 604);

    await _loadQuranPage(_currentPage);
  }

  Future<void> _savePage(int page) async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setInt(
      'last_quran_page',
      page,
    );
  }

  Future<void> _loadQuranPage(
    int page,
  ) async {
    if (page < 1 || page > 604) return;

    if (mounted) {
      setState(() {
        _loadingPage = true;
        _currentPage = page;
      });
    }

    try {
      final response = await _dio.get(
        'https://api.alquran.cloud/v1/page/$page/quran-uthmani',
      );

      final data = response.data;

      if (data is Map &&
          data['data'] != null &&
          data['data']['ayahs'] is List) {
        _pageAyahs = data['data']['ayahs'];

        await _savePage(page);
      }
    } catch (e) {
      debugPrint('Quran page error: $e');
      _pageAyahs = [];
    }

    if (mounted) {
      setState(() {
        _loadingPage = false;
      });
    }
  }

  void _nextPage() {
    if (_currentPage < 604) {
      _loadQuranPage(
        _currentPage + 1,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 1) {
      _loadQuranPage(
        _currentPage - 1,
      );
    }
  }

  // ==========================================================================
  // البحث
  // ==========================================================================

  List<QuranSurah> get _filteredSurahs {
    if (_searchQuery.trim().isEmpty) {
      return QuranData.surahs;
    }

    final query =
        _searchQuery.trim();

    return QuranData.surahs.where(
      (surah) {
        return surah.name.contains(query) ||
            surah.number.toString() ==
                query;
      },
    ).toList();
  }

  List<Reciter> get _filteredReciters {
    if (_searchQuery.trim().isEmpty) {
      return _reciters;
    }

    final query =
        _searchQuery.trim();

    return _reciters.where(
      (reciter) {
        return reciter.name.contains(query);
      },
    ).toList();
  }

  List<DownloadedQuran> get _filteredDownloads {
    if (_searchQuery.trim().isEmpty) {
      return _downloadedQuran;
    }

    final query =
        _searchQuery.trim();

    return _downloadedQuran.where(
      (item) {
        return item.surahName.contains(query) ||
            item.reciterName.contains(query) ||
            item.surahNumber.toString() ==
                query;
      },
    ).toList();
  }

  // ==========================================================================
  // الأدوات
  // ==========================================================================

  String _formatTime(Duration duration) {
    String twoDigits(int number) =>
        number.toString().padLeft(2, '0');

    final minutes =
        twoDigits(
      duration.inMinutes.remainder(60),
    );

    final seconds =
        twoDigits(
      duration.inSeconds.remainder(60),
    );

    return '$minutes:$seconds';
  }


}
