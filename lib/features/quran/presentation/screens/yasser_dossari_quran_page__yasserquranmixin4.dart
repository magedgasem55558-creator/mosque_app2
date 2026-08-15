part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin4 on _YasserDossariQuranPageState {
  Future<void> _downloadSurah(int index) async {
    final reciter = _selectedReciter;

    final fileKey =
        _getFileKey(reciter, index);

    final url =
        _getSurahUrl(reciter, index);

    final savePath =
        await _getFilePath(reciter, index);

    try {
      setState(() {
        _downloadProgress[fileKey] = 0;
      });

      await _dio.download(
        url,
        savePath,
        deleteOnError: true,
        onReceiveProgress: (received, total) {
          if (!mounted) return;

          if (total > 0) {
            setState(() {
              _downloadProgress[fileKey] =
                  received / total;
            });
          }
        },
      );

      final item = DownloadedQuran(
        reciterId: reciter.id,
        reciterName: reciter.name,
        surahNumber: index + 1,
        surahName:
            QuranData.surahNames[index],
        filePath: savePath,
      );

      await _addDownloadedQuran(item);

      if (!mounted) return;

      setState(() {
        _downloadedSurahs[fileKey] = true;
        _downloadProgress.remove(fileKey);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: QuranTheme.darkGreen,
          behavior: SnackBarBehavior.floating,
          content: Text(
            'تم تنزيل سورة ${QuranData.surahNames[index]} بصوت ${reciter.name}',
          ),
          action: SnackBarAction(
            label: 'التنزيلات',
            textColor: QuranTheme.gold,
            onPressed: () {
              setState(() {
                _selectedTab = 1;
              });
            },
          ),
        ),
      );
    } catch (e) {
      debugPrint('Download error: $e');

      if (!mounted) return;

      setState(() {
        _downloadProgress.remove(fileKey);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'تعذر تحميل السورة، تحقق من اتصال الإنترنت',
          ),
        ),
      );
    }
  }

  // ==========================================================================
  // تشغيل السورة الحالية
  // ==========================================================================

  Future<void> _playSurah(int index) async {
    final reciter = _selectedReciter;

    final fileKey =
        _getFileKey(reciter, index);

    final downloaded =
        _downloadedSurahs[fileKey] == true;

    if (_currentSurahIndex == index &&
        _currentReciterId == reciter.id) {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.resume();
      }

      return;
    }

    await _audioPlayer.stop();

    setState(() {
      _currentSurahIndex = index;
      _currentReciterId = reciter.id;
      _position = Duration.zero;
      _duration = Duration.zero;
      _isPlaying = false;
    });

    final path =
        await _getFilePath(reciter, index);

    if (downloaded &&
        File(path).existsSync()) {
      await _audioPlayer.play(
        DeviceFileSource(path),
      );
    } else {
      await _audioPlayer.play(
        UrlSource(
          _getSurahUrl(
            reciter,
            index,
          ),
        ),
      );
    }
  }

  // ==========================================================================
  // تشغيل تنزيل محدد - بدون إنترنت
  // ==========================================================================

  Future<void> _playDownloaded(
    DownloadedQuran item,
  ) async {
    final file = File(item.filePath);

    if (!await file.exists()) {
      await _removeDownloadedQuran(item);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'ملف السورة غير موجود، تمت إزالته من التنزيلات',
            ),
          ),
        );
      }

      return;
    }

    await _audioPlayer.stop();

    final surahIndex =
        item.surahNumber - 1;

    setState(() {
      _currentSurahIndex = surahIndex;
      _currentReciterId = item.reciterId;
      _position = Duration.zero;
      _duration = Duration.zero;
      _isPlaying = false;
    });

    await _audioPlayer.play(
      DeviceFileSource(item.filePath),
    );
  }

  // ==========================================================================
  // حذف تنزيل
  // ==========================================================================


}
