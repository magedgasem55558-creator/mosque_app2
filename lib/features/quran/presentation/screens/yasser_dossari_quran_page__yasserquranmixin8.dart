part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin8 on _YasserDossariQuranPageState {
  Widget _buildSurahTab() {
    final surahs =
        _filteredSurahs;

    if (surahs.isEmpty) {
      return _emptyState(
        Icons.search_off_rounded,
        'لا توجد نتائج',
      );
    }

    return ListView.builder(
      key:
          const ValueKey('surahs'),
      padding:
          const EdgeInsets.fromLTRB(
        16,
        10,
        16,
        20,
      ),
      itemCount:
          surahs.length,
      itemBuilder:
          (context, index) {
        return _buildSurahCard(
          surahs[index],
        );
      },
    );
  }


}
