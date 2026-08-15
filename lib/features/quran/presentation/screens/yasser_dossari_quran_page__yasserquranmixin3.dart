part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin3 on _YasserDossariQuranPageState {
  Future<void> _loadDownloadedQuran() async {
    final prefs = await SharedPreferences.getInstance();

    final raw =
        prefs.getStringList('quran_downloaded_items') ?? [];

    _downloadedQuran.clear();

    for (final item in raw) {
      try {
        final decoded =
            jsonDecode(item);

        if (decoded is Map<String, dynamic>) {
          final download =
              DownloadedQuran.fromJson(decoded);

          if (File(download.filePath).existsSync()) {
            _downloadedQuran.add(download);
          }
        }
      } catch (_) {}
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _saveDownloadedQuran() async {
    final prefs = await SharedPreferences.getInstance();

    final data = _downloadedQuran
        .map(
          (item) => jsonEncode(item.toJson()),
        )
        .toList();

    await prefs.setStringList(
      'quran_downloaded_items',
      data,
    );
  }

  Future<void> _addDownloadedQuran(
    DownloadedQuran item,
  ) async {
    _downloadedQuran.removeWhere(
      (old) =>
          old.reciterId == item.reciterId &&
          old.surahNumber == item.surahNumber,
    );

    _downloadedQuran.insert(0, item);

    await _saveDownloadedQuran();

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _removeDownloadedQuran(
    DownloadedQuran item,
  ) async {
    try {
      final file = File(item.filePath);

      if (await file.exists()) {
        await file.delete();
      }
    } catch (_) {}

    _downloadedQuran.removeWhere(
      (old) =>
          old.reciterId == item.reciterId &&
          old.surahNumber == item.surahNumber,
    );

    final key =
        '${item.reciterId}_${item.surahNumber}';

    _downloadedSurahs.remove(key);

    await _saveDownloadedQuran();

    if (mounted) {
      setState(() {});
    }
  }

  // ==========================================================================
  // الملفات
  // ==========================================================================

  String _getFileKey(
    Reciter reciter,
    int surahIndex,
  ) {
    return '${reciter.id}_${surahIndex + 1}';
  }

  String _getFileKeyFromValues(
    String reciterId,
    int surahNumber,
  ) {
    return '${reciterId}_$surahNumber';
  }

  String _getSurahUrl(
    Reciter reciter,
    int index,
  ) {
    final number =
        (index + 1).toString().padLeft(3, '0');

    String base = reciter.serverUrl;

    if (!base.endsWith('/')) {
      base += '/';
    }

    return '$base$number.mp3';
  }

  Future<String> _getFilePath(
    Reciter reciter,
    int index,
  ) async {
    final directory =
        await getApplicationDocumentsDirectory();

    return '${directory.path}/quran_${_getFileKey(reciter, index)}.mp3';
  }

  Future<void> _checkDownloadedFiles() async {
    for (final reciter in _reciters) {
      for (
        int i = 0;
        i < QuranData.surahNames.length;
        i++
      ) {
        final path =
            await _getFilePath(reciter, i);

        if (File(path).existsSync()) {
          final key =
              _getFileKey(reciter, i);

          _downloadedSurahs[key] = true;

          final exists =
              _downloadedQuran.any(
            (item) =>
                item.reciterId == reciter.id &&
                item.surahNumber == i + 1,
          );

          if (!exists) {
            await _addDownloadedQuran(
              DownloadedQuran(
                reciterId: reciter.id,
                reciterName: reciter.name,
                surahNumber: i + 1,
                surahName:
                    QuranData.surahNames[i],
                filePath: path,
              ),
            );
          }
        }
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  // ==========================================================================
  // تحميل السورة
  // ==========================================================================


}
