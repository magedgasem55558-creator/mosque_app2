part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin11 on _YasserDossariQuranPageState {
  Widget _buildDownloadedCard(
    DownloadedQuran item,
  ) {
    final isCurrent =
        _currentSurahIndex ==
                item.surahNumber - 1 &&
            _currentReciterId ==
                item.reciterId;

    return Container(
      margin:
          const EdgeInsets.only(
        bottom: 10,
      ),
      decoration:
          BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(
          22,
        ),
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
            _playDownloaded(item),
        child: Padding(
          padding:
              const EdgeInsets.all(
            12,
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration:
                    BoxDecoration(
                  color:
                      QuranTheme.cream,
                  shape:
                      BoxShape.circle,
                  border:
                      Border.all(
                    color:
                        QuranTheme.gold
                            .withOpacity(
                          .5,
                        ),
                  ),
                ),
                child: Center(
                  child: Text(
                    '${item.surahNumber}',
                    style:
                        const TextStyle(
                      color:
                          QuranTheme.green,
                      fontWeight:
                          FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'سورة ${item.surahName}',
                      style:
                          const TextStyle(
                        color:
                            QuranTheme.text,
                        fontSize: 15,
                        fontWeight:
                            FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons
                              .record_voice_over_rounded,
                          size: 14,
                          color:
                              QuranTheme.green,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            item.reciterName,
                            maxLines: 1,
                            overflow:
                                TextOverflow
                                    .ellipsis,
                            style:
                                TextStyle(
                              color: Colors
                                  .grey
                                  .shade600,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons
                              .wifi_off_rounded,
                          size: 13,
                          color:
                              QuranTheme.green,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'متاحة بدون إنترنت',
                          style:
                              TextStyle(
                            color:
                                QuranTheme.green,
                            fontSize: 10,
                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip:
                    'حذف',
                onPressed: () =>
                    _confirmDeleteDownload(
                  item,
                ),
                icon:
                    const Icon(
                  Icons
                      .delete_outline_rounded,
                  color:
                      Colors.redAccent,
                ),
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
