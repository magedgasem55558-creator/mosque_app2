part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin10 on _YasserDossariQuranPageState {
  Widget _buildSurahNumber(
    int number,
    bool current,
  ) {
    return Container(
      width: 48,
      height: 48,
      decoration:
          BoxDecoration(
        color: current
            ? QuranTheme.gold
            : QuranTheme.cream,
        shape:
            BoxShape.circle,
        border:
            Border.all(
          color:
              QuranTheme.gold
                  .withOpacity(.45),
        ),
      ),
      child: Center(
        child: Text(
          '$number',
          style:
              TextStyle(
            color: current
                ? QuranTheme.darkGreen
                : QuranTheme.green,
            fontWeight:
                FontWeight.w900,
          ),
        ),
      ),
    );
  }

  // ==========================================================================
  // قسم التنزيلات
  // ==========================================================================

  Widget _buildDownloadsTab() {
    final downloads =
        _filteredDownloads;

    if (downloads.isEmpty) {
      return _buildEmptyDownloads();
    }

    return Column(
      key: const ValueKey(
        'downloads',
      ),
      children: [
        _buildDownloadsHeader(
          downloads.length,
        ),
        Expanded(
          child:
              ListView.builder(
            padding:
                const EdgeInsets.fromLTRB(
              16,
              8,
              16,
              20,
            ),
            itemCount:
                downloads.length,
            itemBuilder:
                (context, index) {
              return _buildDownloadedCard(
                downloads[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDownloadsHeader(
    int count,
  ) {
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(
        16,
        10,
        16,
        4,
      ),
      child: Container(
        padding:
            const EdgeInsets.all(
          15,
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
                    .withOpacity(.30),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration:
                  BoxDecoration(
                color:
                    QuranTheme.cream,
                borderRadius:
                    BorderRadius.circular(
                  14,
                ),
              ),
              child:
                  const Icon(
                Icons
                    .download_done_rounded,
                color:
                    QuranTheme.green,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'السور المحملة',
                    style:
                        TextStyle(
                      color:
                          QuranTheme.darkGreen,
                      fontSize: 16,
                      fontWeight:
                          FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'استمع إليها بدون اتصال بالإنترنت',
                    style:
                        TextStyle(
                      color:
                          Colors.black54,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 7,
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
                '$count',
                style:
                    const TextStyle(
                  color:
                      QuranTheme.green,
                  fontWeight:
                      FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
