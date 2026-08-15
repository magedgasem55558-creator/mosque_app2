part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin7 on _YasserDossariQuranPageState {
  Widget _buildSearchBar() {
    String hint = 'ابحث عن سورة أو قارئ...';

    if (_selectedTab == 1) {
      hint = 'ابحث في التنزيلات...';
    }

    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Container(
        decoration:
            BoxDecoration(
          color:
              Colors.white.withOpacity(.96),
          borderRadius:
              BorderRadius.circular(20),
        ),
        child: TextField(
          textDirection:
              TextDirection.rtl,
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          decoration:
              InputDecoration(
            hintText: hint,
            hintStyle:
                TextStyle(
              color:
                  Colors.grey.shade500,
              fontSize: 13,
            ),
            prefixIcon:
                const Icon(
              Icons.search_rounded,
              color:
                  QuranTheme.green,
            ),
            suffixIcon:
                _searchQuery.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _searchQuery =
                                '';
                          });
                        },
                        icon:
                            const Icon(
                          Icons
                              .close_rounded,
                        ),
                      )
                    : null,
            border:
                InputBorder.none,
            contentPadding:
                const EdgeInsets
                    .symmetric(
              horizontal: 18,
              vertical: 15,
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================================================
  // التبويبات
  // ==========================================================================

  Widget _buildMainTabs() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: Container(
        padding:
            const EdgeInsets.all(5),
        decoration:
            BoxDecoration(
          color:
              Colors.white.withOpacity(.90),
          borderRadius:
              BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            _tabButton(
              0,
              Icons.list_alt_rounded,
              'السور',
            ),
            _tabButton(
              1,
              Icons.download_done_rounded,
              'التنزيلات',
            ),
            _tabButton(
              2,
              Icons.auto_stories_rounded,
              'الصفحات',
            ),
            _tabButton(
              3,
              Icons.record_voice_over_rounded,
              'القراء',
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(
    int index,
    IconData icon,
    String title,
  ) {
    final selected =
        _selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = index;
          });

          if (index == 2 &&
              _pageAyahs.isEmpty) {
            _loadQuranPage(
              _currentPage,
            );
          }
        },
        child: AnimatedContainer(
          duration:
              const Duration(
            milliseconds: 250,
          ),
          padding:
              const EdgeInsets.symmetric(
            vertical: 11,
          ),
          decoration:
              BoxDecoration(
            gradient: selected
                ? const LinearGradient(
                    colors: [
                      QuranTheme.darkGreen,
                      QuranTheme.green,
                    ],
                  )
                : null,
            borderRadius:
                BorderRadius.circular(
              14,
            ),
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 17,
                color: selected
                    ? Colors.white
                    : Colors.grey.shade600,
              ),
              const SizedBox(height: 3),
              Text(
                title,
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : Colors.grey.shade700,
                  fontWeight:
                      selected
                          ? FontWeight.bold
                          : FontWeight.w500,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================================================
  // السور
  // ==========================================================================


}
