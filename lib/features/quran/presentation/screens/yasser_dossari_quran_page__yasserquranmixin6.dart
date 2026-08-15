part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin6 on _YasserDossariQuranPageState {
  void _seek(int seconds) {
    var position =
        _position +
        Duration(seconds: seconds);

    if (position < Duration.zero) {
      position = Duration.zero;
    }

    if (position > _duration) {
      position = _duration;
    }

    _audioPlayer.seek(position);
  }

  // ==========================================================================
  // BUILD
  // ==========================================================================

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:
            QuranTheme.background,
        body: Stack(
          children: [
            _buildBackground(),

            SafeArea(
              child: Column(
                children: [
                  _buildTopHeader(),

                  _buildSearchBar(),

                  _buildMainTabs(),

                  Expanded(
                    child: AnimatedSwitcher(
                      duration:
                          const Duration(
                        milliseconds: 300,
                      ),
                      child:
                          _selectedTab == 0
                              ? _buildSurahTab()
                              : _selectedTab == 1
                                  ? _buildDownloadsTab()
                                  : _selectedTab == 2
                                      ? _buildPagesTab()
                                      : _buildRecitersTab(),
                    ),
                  ),

                  if (_currentSurahIndex != null)
                    _buildAudioPlayer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================================
  // الخلفية
  // ==========================================================================

  Widget _buildBackground() {
    return Container(
      decoration:
          const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF063B32),
            Color(0xFF0B6B57),
            Color(0xFFF4F7F5),
          ],
          stops: [
            0,
            .32,
            .70,
          ],
        ),
      ),
    );
  }

  // ==========================================================================
  // الهيدر
  // ==========================================================================

  Widget _buildTopHeader() {
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(
        16,
        12,
        16,
        8,
      ),
      child: Container(
        padding:
            const EdgeInsets.all(18),
        decoration:
            BoxDecoration(
          color:
              Colors.white.withOpacity(.96),
          borderRadius:
              BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(.14),
              blurRadius: 25,
              offset:
                  const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration:
                  BoxDecoration(
                gradient:
                    const LinearGradient(
                  colors: [
                    QuranTheme.gold,
                    Color(0xFFE6C76B),
                  ],
                ),
                borderRadius:
                    BorderRadius.circular(
                  18,
                ),
              ),
              child: const Icon(
                Icons.menu_book_rounded,
                color:
                    QuranTheme.darkGreen,
                size: 30,
              ),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'القرآن الكريم',
                    style: TextStyle(
                      color:
                          QuranTheme.darkGreen,
                      fontSize: 22,
                      fontWeight:
                          FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'تلاوة • تدبر • استماع',
                    style: TextStyle(
                      color:
                          Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(
                color:
                    QuranTheme.cream,
                borderRadius:
                    BorderRadius.circular(
                  15,
                ),
              ),
              child: IconButton(
                tooltip:
                    'الصفحة الأخيرة',
                onPressed: () {
                  setState(() {
                    _selectedTab = 2;
                  });

                  _loadQuranPage(
                    _currentPage,
                  );
                },
                icon: const Icon(
                  Icons.bookmark_rounded,
                  color:
                      QuranTheme.gold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================================
  // البحث
  // ==========================================================================


}
