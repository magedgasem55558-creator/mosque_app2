part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin9 on _YasserDossariQuranPageState {
  Widget _buildSurahCard(
    QuranSurah surah,
  ) {
    final index =
        surah.number - 1;

    final isCurrent =
        _currentSurahIndex ==
                index &&
            _currentReciterId ==
                _selectedReciter.id;

    final key =
        _getFileKey(
      _selectedReciter,
      index,
    );

    final downloaded =
        _downloadedSurahs[key] ==
            true;

    final downloading =
        _downloadProgress
            .containsKey(key);

    final favorite =
        _favorites
            .contains(
          surah.number,
        );

    return Container(
      margin:
          const EdgeInsets.only(
        bottom: 10,
      ),
      decoration:
          BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(22),
        border: Border.all(
          color: isCurrent
              ? QuranTheme.gold
              : Colors.grey.shade200,
          width:
              isCurrent ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(.045),
            blurRadius: 15,
            offset:
                const Offset(0, 5),
          ),
        ],
      ),
      child: InkWell(
        borderRadius:
            BorderRadius.circular(
          22,
        ),
        onTap: () =>
            _playSurah(index),
        child: Padding(
          padding:
              const EdgeInsets.all(
            12,
          ),
          child: Row(
            children: [
              _buildSurahNumber(
                surah.number,
                isCurrent,
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'سورة ${surah.name}',
                      style:
                          const TextStyle(
                        color:
                            QuranTheme.text,
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      downloaded
                          ? 'متاحة بدون إنترنت • ${_selectedReciter.name}'
                          : 'استماع مباشر • ${_selectedReciter.name}',
                      maxLines: 1,
                      overflow:
                          TextOverflow.ellipsis,
                      style:
                          TextStyle(
                        color: downloaded
                            ? QuranTheme.green
                            : Colors.grey.shade500,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip:
                    'مفضلة',
                onPressed: () =>
                    _toggleFavorite(
                  surah.number,
                ),
                icon: Icon(
                  favorite
                      ? Icons
                          .favorite_rounded
                      : Icons
                          .favorite_border_rounded,
                  color: favorite
                      ? Colors.redAccent
                      : Colors.grey.shade400,
                ),
              ),
              if (downloading)
                SizedBox(
                  width: 26,
                  height: 26,
                  child:
                      CircularProgressIndicator(
                    strokeWidth: 2.5,
                    value:
                        _downloadProgress[
                            key],
                    color:
                        QuranTheme.green,
                  ),
                )
              else if (!downloaded)
                IconButton(
                  tooltip:
                      'تحميل',
                  onPressed: () =>
                      _downloadSurah(
                    index,
                  ),
                  icon:
                      const Icon(
                    Icons
                        .download_for_offline_rounded,
                    color:
                        QuranTheme.green,
                  ),
                )
              else
                const Icon(
                  Icons
                      .offline_pin_rounded,
                  color:
                      QuranTheme.green,
                  size: 25,
                ),
              const SizedBox(
                width: 3,
              ),
              Container(
                width: 46,
                height: 46,
                decoration:
                    BoxDecoration(
                  gradient:
                      const LinearGradient(
                    colors: [
                      QuranTheme.darkGreen,
                      QuranTheme.green,
                    ],
                  ),
                  shape:
                      BoxShape.circle,
                ),
                child: Icon(
                  isCurrent &&
                          _isPlaying
                      ? Icons
                          .pause_rounded
                      : Icons
                          .play_arrow_rounded,
                  color:
                      Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
