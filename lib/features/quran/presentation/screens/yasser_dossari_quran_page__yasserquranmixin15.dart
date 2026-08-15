part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin15 on _YasserDossariQuranPageState {
  Widget _buildPageNavigation() {
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(
        16,
        4,
        16,
        12,
      ),
      child: Row(
        children: [
          Expanded(
            child:
                _pageButton(
              icon:
                  Icons.chevron_right_rounded,
              title:
                  'الصفحة السابقة',
              enabled:
                  _currentPage > 1,
              onPressed:
                  _previousPage,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child:
                _pageButton(
              icon:
                  Icons.chevron_left_rounded,
              title:
                  'الصفحة التالية',
              enabled:
                  _currentPage < 604,
              onPressed:
                  _nextPage,
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageButton({
    required IconData icon,
    required String title,
    required bool enabled,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed:
          enabled
              ? onPressed
              : null,
      icon:
          Icon(icon),
      label:
          Text(title),
      style:
          ElevatedButton.styleFrom(
        backgroundColor:
            QuranTheme.darkGreen,
        foregroundColor:
            Colors.white,
        disabledBackgroundColor:
            Colors.grey.shade300,
        disabledForegroundColor:
            Colors.grey.shade500,
        elevation: 0,
        padding:
            const EdgeInsets
                .symmetric(
          vertical: 12,
        ),
        shape:
            RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(
            15,
          ),
        ),
      ),
    );
  }

  // ==========================================================================
  // القراء
  // ==========================================================================

  Widget _buildRecitersTab() {
    final reciters =
        _filteredReciters;

    if (_loadingReciters) {
      return const Center(
        child:
            CircularProgressIndicator(
          color:
              QuranTheme.gold,
        ),
      );
    }

    if (reciters.isEmpty) {
      return _emptyState(
        Icons
            .person_off_rounded,
        'لا يوجد قارئ مطابق للبحث',
      );
    }

    return ListView.builder(
      key:
          const ValueKey(
        'reciters',
      ),
      padding:
          const EdgeInsets.fromLTRB(
        16,
        10,
        16,
        20,
      ),
      itemCount:
          reciters.length,
      itemBuilder:
          (context, index) {
        final reciter =
            reciters[index];

        final selected =
            reciter.id ==
                _selectedReciter.id;

        return _buildReciterCard(
          reciter,
          selected,
        );
      },
    );
  }


}
