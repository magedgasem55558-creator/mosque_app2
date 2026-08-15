part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin2 on _YasserDossariQuranPageState {
  Widget _buildTipItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(.10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Colors.teal,
              size: 22,
            ),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================================
  // الصوت
  // ==========================================================================

  void _listenToAudio() {
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;

      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      if (!mounted) return;

      setState(() {
        _duration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((position) {
      if (!mounted) return;

      setState(() {
        _position = position;
      });
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      if (!mounted) return;

      setState(() {
        _isPlaying = false;
      });
    });
  }

  // ==========================================================================
  // القراء API
  // ==========================================================================

  Future<void> _loadRecitersFromApi() async {
    try {
      final response = await _dio.get(
        'https://www.mp3quran.net/api/v3/reciters?language=ar',
      );

      final data = response.data;

      if (data is Map && data['reciters'] is List) {
        final List<Reciter> result = [];

        for (final reciter in data['reciters']) {
          final name = reciter['name'];
          final moshaf = reciter['moshaf'];

          if (name == null ||
              moshaf is! List ||
              moshaf.isEmpty) {
            continue;
          }

          final firstMoshaf = moshaf.first;
          final server = firstMoshaf['server'];

          if (server == null) continue;

          result.add(
            Reciter(
              id: '${reciter['id']}',
              name: name.toString(),
              serverUrl: server.toString(),
            ),
          );
        }

        if (result.isNotEmpty && mounted) {
          setState(() {
            _reciters = result;
            _loadingReciters = false;

            final match = result.where(
              (e) => e.id == _selectedReciter.id,
            );

            if (match.isNotEmpty) {
              _selectedReciter = match.first;
            }
          });

          return;
        }
      }
    } catch (e) {
      debugPrint('Reciters API error: $e');
    }

    if (mounted) {
      setState(() {
        _loadingReciters = false;
      });
    }
  }

  // ==========================================================================
  // SharedPreferences
  // ==========================================================================

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    final favorites =
        prefs.getStringList('quran_favorites') ?? [];

    _favorites.clear();

    for (final value in favorites) {
      final number = int.tryParse(value);

      if (number != null) {
        _favorites.add(number);
      }
    }
  }

  Future<void> _toggleFavorite(int surahNumber) async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      if (_favorites.contains(surahNumber)) {
        _favorites.remove(surahNumber);
      } else {
        _favorites.add(surahNumber);
      }
    });

    await prefs.setStringList(
      'quran_favorites',
      _favorites.map((e) => e.toString()).toList(),
    );
  }

  // ==========================================================================
  // حفظ التنزيلات
  // ==========================================================================


}
