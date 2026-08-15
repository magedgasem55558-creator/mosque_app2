part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin12 on _YasserDossariQuranPageState {
  Widget _buildEmptyDownloads() {
    return Center(
      key: const ValueKey(
        'empty_downloads',
      ),
      child: Padding(
        padding:
            const EdgeInsets.all(
          30,
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration:
                  BoxDecoration(
                color:
                    Colors.white,
                shape:
                    BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(
                      .07,
                    ),
                    blurRadius: 20,
                  ),
                ],
              ),
              child:
                  const Icon(
                Icons
                    .download_for_offline_rounded,
                size: 46,
                color:
                    QuranTheme.green,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              'لا توجد سور محملة',
              style:
                  TextStyle(
                color:
                    QuranTheme.darkGreen,
                fontSize: 18,
                fontWeight:
                    FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'قم بتحميل أي سورة من قسم السور، '
              'وستظهر هنا لتستمع إليها لاحقًا '
              'بدون إنترنت.',
              textAlign:
                  TextAlign.center,
              style:
                  TextStyle(
                color:
                    Colors.grey.shade600,
                fontSize: 13,
                height: 1.6,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _selectedTab = 0;
                  _searchQuery = '';
                });
              },
              icon: const Icon(
                Icons.menu_book_rounded,
              ),
              label:
                  const Text(
                'تصفح السور',
              ),
              style:
                  ElevatedButton.styleFrom(
                backgroundColor:
                    QuranTheme.darkGreen,
                foregroundColor:
                    Colors.white,
                elevation: 0,
                padding:
                    const EdgeInsets
                        .symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape:
                    RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(
                    14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================================
  // الصفحات
  // ==========================================================================

  Widget _buildPagesTab() {
    return Column(
      key:
          const ValueKey('pages'),
      children: [
        _buildPageHeader(),
        Expanded(
          child: _loadingPage
              ? const Center(
                  child:
                      CircularProgressIndicator(
                    color:
                        QuranTheme.gold,
                  ),
                )
              : _pageAyahs.isEmpty
                  ? _emptyState(
                      Icons
                          .menu_book_rounded,
                      'تعذر تحميل الصفحة',
                    )
                  : _buildQuranPage(),
        ),
        _buildPageNavigation(),
      ],
    );
  }


}
