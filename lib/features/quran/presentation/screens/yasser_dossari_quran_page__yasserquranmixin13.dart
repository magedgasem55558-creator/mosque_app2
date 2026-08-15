part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin13 on _YasserDossariQuranPageState {
  Widget _buildPageHeader() {
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(
        16,
        10,
        16,
        6,
      ),
      child: Container(
        padding:
            const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration:
            BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(
            18,
          ),
          border: Border.all(
            color:
                QuranTheme.gold
                    .withOpacity(.35),
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons
                  .auto_stories_rounded,
              color:
                  QuranTheme.gold,
            ),
            const SizedBox(
              width: 9,
            ),
            const Expanded(
              child: Text(
                'صفحات المصحف الشريف',
                style:
                    TextStyle(
                  color:
                      QuranTheme.darkGreen,
                  fontSize: 15,
                  fontWeight:
                      FontWeight.w900,
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets
                      .symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration:
                  BoxDecoration(
                color:
                    QuranTheme.cream,
                borderRadius:
                    BorderRadius.circular(
                  12,
                ),
              ),
              child: Text(
                '$_currentPage / 604',
                style:
                    const TextStyle(
                  color:
                      QuranTheme.green,
                  fontWeight:
                      FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
