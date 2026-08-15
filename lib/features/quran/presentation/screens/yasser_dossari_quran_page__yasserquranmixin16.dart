part of 'yasser_dossari_quran_page.dart';

mixin _YasserQuranMixin16 on _YasserDossariQuranPageState {
  Widget _buildReciterCard(
    Reciter reciter,
    bool selected,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(
        bottom: 10,
      ),
      decoration:
          BoxDecoration(
        color:
            Colors.white,
        borderRadius:
            BorderRadius.circular(
          22,
        ),
        border: Border.all(
          color: selected
              ? QuranTheme.gold
              : Colors.grey.shade200,
          width:
              selected ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(.04),
            blurRadius: 15,
          ),
        ],
      ),
      child: InkWell(
        borderRadius:
            BorderRadius.circular(
          22,
        ),
        onTap: () async {
          await _changeReciter(
            reciter,
          );

          if (mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                behavior:
                    SnackBarBehavior
                        .floating,
                backgroundColor:
                    QuranTheme
                        .darkGreen,
                content:
                    Text(
                  'تم اختيار القارئ ${reciter.name}',
                ),
              ),
            );
          }
        },
        child: Padding(
          padding:
              const EdgeInsets.all(
            14,
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration:
                    BoxDecoration(
                  gradient:
                      selected
                          ? const LinearGradient(
                              colors: [
                                QuranTheme
                                    .gold,
                                Color(
                                  0xFFE6C76B,
                                ),
                              ],
                            )
                          : const LinearGradient(
                              colors: [
                                QuranTheme
                                    .darkGreen,
                                QuranTheme
                                    .green,
                              ],
                            ),
                  shape:
                      BoxShape.circle,
                ),
                child: Icon(
                  Icons
                      .record_voice_over_rounded,
                  color: selected
                      ? QuranTheme
                          .darkGreen
                      : Colors.white,
                  size: 26,
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      reciter.name,
                      style:
                          const TextStyle(
                        color:
                            QuranTheme.text,
                        fontSize: 15,
                        fontWeight:
                            FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      'تلاوة القرآن الكريم',
                      style:
                          TextStyle(
                        color:
                            Colors.black45,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              if (selected)
                Container(
                  padding:
                      const EdgeInsets
                          .symmetric(
                    horizontal: 10,
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
                  child:
                      const Text(
                    'مختار',
                    style:
                        TextStyle(
                      color:
                          QuranTheme.green,
                      fontSize: 11,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                )
              else
                const Icon(
                  Icons
                      .arrow_back_ios_new_rounded,
                  size: 16,
                  color:
                      Colors.grey,
                ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================================================
  // مشغل الصوت
  // ==========================================================================


}
